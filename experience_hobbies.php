<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';


//api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$tables = 'experience_hobbies';
$sql4 = "SELECT * FROM $tables ";
$result = Database::query($sql4);
$xpHobbies = Database::store_result($result, 'ASSOC');

$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
$id_user =  api_get_user_id();

$xpHobbies= null;
if (!empty($id_user)) {
    $sql4 = "SELECT * FROM $tables WHERE  id_user = $id_user";
    $result = Database::query($sql4);
    $xpHobbies = Database::fetch_array($result, 'ASSOC');
	
}



$form = new FormValidator('add', 'post', api_get_self().'?action='.$action.'&id_user='.$id_user);
$form->addText('title', $plugin->get_lang('Passion'), true);
$form->addTextarea('description', $plugin->get_lang('Description'), [], true);
$form->addButtonSave(get_lang('Save'));
$form->addButtonCancel(get_lang('Cancel'));

switch ($action) {
    case 'add':
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
		      'id_user' => api_get_user_id(),
			  'type' => 3,
		      'title' => $values['title'],
              'description' => $values['description'],
            ];
            $result = Database::insert($tables, $params);
            if ($result) {
                Display::addFlash(Display::return_message(get_lang('Les Hobbies ont été ajoutés !!')));
            }
            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;


    case 'edit':
        $form->setDefaults($xpHobbies);
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
		      
              'title' => $values['title'],
              'description' => $values['description'],
            ];
            Database::update($tables, $params, ['id_user = ?' => $id_user]);
            Display::addFlash(Display::return_message(get_lang('Mise à jour des hobbies  !!')));

            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;
    case 'delete':
        if (!empty($xpHobbies)) {
            Database::delete($tables, ['id = ?' => $id]);
            Display::addFlash(Display::return_message(get_lang('Hobbies supprimés !')));
            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;

        case 'cancel':
        if (empty($xpHobbies)) {
            Database::delete($tables, ['id_user = ?' => $id_user]);
				header('Location: cv.php');
                exit;
        }
        break;
}

$tpl = new Template($plugin->get_lang('Hobbies'));
$tpl->assign('xpHobbies ', $xpHobbies );
$tpl->assign('form', $form->returnForm());
$content = $tpl->fetch('/'.$plugin->get_name().'/view/nh8.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();

