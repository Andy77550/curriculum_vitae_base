<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';


//api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$tables = 'experience_pro';
$sql2 = "SELECT * FROM $tables ";
$result = Database::query($sql2);
$xpPro = Database::store_result($result, 'ASSOC');

$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id_user =  api_get_user_id();

$xpPro= null;
if (!empty($id_user)) {
    $sql2 = "SELECT * FROM $tables WHERE id = $id_user AND id_user = $id_user";
    $result = Database::query($sql2);
    $xpPro = Database::fetch_array($result, 'ASSOC');
	
}



$form = new FormValidator('add', 'post', api_get_self().'?action='.$action.'&id_user='.$id_user);
$form->addDatePicker('date_begin', $plugin->get_lang('Date de début'));
$form->addDatePicker('date_end', $plugin->get_lang('Date de fin'));
$form->addText('title', $plugin->get_lang('Titre'), true);
$form->addTextarea('description', $plugin->get_lang('Description'), [], true);
$form->addButtonSave(get_lang('Save'));

switch ($action) {
    case 'add':
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
				'id' => api_get_user_id(),
				'id_user' => api_get_user_id(),
                'date_begin' => $values['date_begin'],
                'date_end' => $values['date_end'],
				'title' => $values['title'],
                'description' => $values['description'],
            ];
            $result = Database::insert($tables, $params);
            if ($result) {
                Display::addFlash(Display::return_message(get_lang('Les expériences Professionnelles/Formations/Hobbies ont été ajoutés !!')));
            }
            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;
    case 'edit':
        $form->setDefaults($xpPro);
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
				'id' => api_get_user_id(),
				'id_user' => api_get_user_id(),
				'date_begin' => $values['date_begin'],
                'date_end' => $values['date_end'],
				'title' => $values['title'],
                'description' => $values['description'],
            ];
            Database::update($tables, $params, ['id_user = ?' => $id_user]);
            Display::addFlash(Display::return_message(get_lang('Mise à jour des expériences professionnelles/formations/hobbies  !!')));

            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;
    case 'delete':
        if (!empty($xpPro)) {
            Database::delete($tables, ['id_user = ?' => $id_user]);
            Display::addFlash(Display::return_message(get_lang('Expériences professionnelles/formations/hobbies supprimés !')));
            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;
}

$tpl = new Template($plugin->get_lang('Etape 2 : Expériences Professionnelles/Formations/Hobbies'));
$tpl->assign('xpPro', $xpPro);
$tpl->assign('form', $form->returnForm());
$content = $tpl->fetch('/'.$plugin->get_name().'/view/view.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();