<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';

//api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$table = 'plugin_curriculum_vitae_base';
$sql = "SELECT * FROM $table ";
$result = Database::query($sql);
$terms = Database::store_result($result, 'ASSOC');


$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id_user = api_get_user_id();

$term = null;
if (!empty($id_user)) {
    $sql = "SELECT * FROM $table WHERE id = $id_user AND id_user = $id_user";
    $result = Database::query($sql);
    $term = Database::fetch_array($result, 'ASSOC');
  
}

$form = new FormValidator('add', 'post', api_get_self().'?action='.$action.'&id_user='.$id_user);
$form->addDatePicker('date_birthday', $plugin->get_lang('Date de naissance'));
$form->addText('phone', $plugin->get_lang('Téléphone'), true);
$form->addText('address', $plugin->get_lang('Adresse'), true);
$form->addTextarea('skill_profil', $plugin->get_lang('Métier actuel'), [], true);
//$form->addHtmlEditor('definition', get_lang('Definition'), true);
$form->addButtonSave(get_lang('Save'));

switch ($action) {
    case 'add':
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
                'id' => api_get_user_id(),
                'id_user' => api_get_user_id(),
                'date_birthday' => $values['date_birthday'],
                'phone' => $values['phone'],
				'address' => $values['address'],
                'skill_profil' => $values['skill_profil'],
            ];
            $result = Database::insert($table, $params);
            if ($result) {
                Display::addFlash(Display::return_message(get_lang('Les informations personnelles ont étés ajoutés !!')));
            }
            header('Location: '.api_get_self());
			header('Location: display-cv.php');
            exit;
        }
        break;
    case 'edit':
        $form->setDefaults($term);
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
                'id' => api_get_user_id(),
                'id_user' => api_get_user_id(),
                'date_birthday' => $values['date_birthday'],
                'phone' => $values['phone'],
				'address' => $values['address'],
                'skill_profil' => $values['skill_profil'],
            ];
            Database::update($table, $params, ['id_user = ?' => $id_user]);
            Display::addFlash(Display::return_message(get_lang('Mise à jour des informations personnelles !! ')));

            header('Location: '.api_get_self());
            header('Location: cv.php');
			
            exit;
        }
        break;
}

$tpl = new Template($plugin->get_lang('Etape 1 : Informations personnelles'));
$tpl->assign('terms', $terms);
$tpl->assign('form', $form->returnForm());
$content = $tpl->fetch('/'.$plugin->get_name().'/view/zo.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();
