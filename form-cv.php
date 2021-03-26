<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';


//api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$table = 'plugin_curriculum_vitae_base';
$sql = "SELECT * FROM $table ";
$result = Database::query($sql);
$infoPerso = Database::store_result($result, 'ASSOC');


$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id_user =  api_get_user_id();
$userInfo = api_get_user_info();
$nameFirst =  api_get_person_name($userInfo['firstname'], null);
$nameLast  = api_get_person_name($userInfo['lastname'], null);





$infoPerso = null;
if (!empty($id_user)) {
    $sql = "SELECT * FROM $table WHERE id_user = $id_user";
    $result = Database::query($sql);
    $infoPerso = Database::fetch_array($result, 'ASSOC');

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

			'id_user' => api_get_user_id(),
            'date_birthday' => $values['date_birthday'],
            'phone' => $values['phone'],
			'address' => $values['address'],
            'skill_profil' => $values['skill_profil'],
            'firstname' =>  api_get_person_name($userInfo['firstname'], null),
            'lastname'  => api_get_person_name($userInfo['lastname'], null),
            ];
		$result = Database::insert($table,$params);
            if ($result) {
				
                Display::addFlash(Display::return_message(get_lang('Les informations personnelles ont été ajoutés !!')));
            }
            header('Location: '.api_get_self());
			header('Location: experience_form.php' );
            exit;
        }
        break;
		
		
		
    case 'edit':
        $form->setDefaults($infoPerso);
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
				
				
                'date_birthday' => $values['date_birthday'],
                'phone' => $values['phone'],
				'address' => $values['address'],
                'skill_profil' => $values['skill_profil'],
            ];
            Database::update($table, $params, ['id_user = ?' => $id_user]);
            Display::addFlash(Display::return_message(get_lang('Mise à jour des informations personnelles !!')));

            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;

        	
    case 'new_edit':
        $form->setDefaults($infoPerso);
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
				
				'date_birthday' => $values['date_birthday'],
                'phone' => $values['phone'],
				'address' => $values['address'],
                'skill_profil' => $values['skill_profil'],
            ];
            Database::update($table, $params, ['id_user = ?' => $id_user]);
            Display::addFlash(Display::return_message(get_lang('Mise à jour des informations personnelles !!')));

            header('Location: '.api_get_self());
			header ('Location: experience_form.php' );
            exit;
        }
        break;

        case 'cancel':
        if (empty($infoPerso)) {
            Database::delete($table, ['id_user = ?' => $id_user]);
            header('Location: '.api_get_self());
            exit;
        }
        break;
}

$tpl = new Template($plugin->get_lang(' Informations personnelles'));
$tpl->assign('infoPerso', $infoPerso);
$tpl->assign('form', $form->returnForm());
$content = $tpl->fetch('/'.$plugin->get_name().'/view/fmv.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();
