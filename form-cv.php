<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';


api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$table = 'plugin_curriculum_vitae_base';
$sql = "SELECT * FROM $table ORDER BY id";
$result = Database::query($sql);
$terms = Database::store_result($result, 'ASSOC');

$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$term = null;
if (!empty($id)) {
    $sql = "SELECT * FROM $table WHERE id = $id";
    $result = Database::query($sql);
    $term = Database::fetch_array($result, 'ASSOC');
    if (empty($term)) {
        api_not_allowed(true);
    }
}

$form = new FormValidator('add', 'post', api_get_self().'?action='.$action.'&id='.$id);
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
                'date_birthday' => $values['date_birthday'],
                'phone' => $values['phone'],
				'address' => $values['address'],
                'skill_profil' => $values['skill_profil'],
            ];
            $result = Database::insert($table, $params);
            if ($result) {
                Display::addFlash(Display::return_message(get_lang('Les informations personnelles ont été ajoutés !!')));
            }
            header('Location: '.api_get_self());
			header('Location: /chamilo-1.11.12/plugin/curriculum_vitae_base/display-cv.php');
            exit;
        }
        break;
    case 'edit':
        $form->setDefaults($term);
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
                'date_birthday' => $values['date_birthday'],
                'phone' => $values['phone'],
				'address' => $values['address'],
                'skill_profil' => $values['skill_profil'],
            ];
            Database::update($table, $params, ['id = ?' => $id]);
            Display::addFlash(Display::return_message(get_lang('Updated')));

            header('Location: '.api_get_self());
			header('Location: /chamilo-1.11.12/plugin/curriculum_vitae_base/display-cv.php');
            exit;
        }
        break;
    case 'delete':
        if (!empty($term)) {
            Database::delete($table, ['id = ?' => $id]);
            Display::addFlash(Display::return_message(get_lang('Deleted')));
            header('Location: '.api_get_self());
			header('Location: /chamilo-1.11.12/plugin/curriculum_vitae_base/display-cv.php');
            exit;
        }
        break;
}

$tpl = new Template($plugin->get_lang('Etape 1 : Informations personnelles'));
$tpl->assign('terms', $terms);
$tpl->assign('form', $form->returnForm());
$content = $tpl->fetch('/'.$plugin->get_name().'/view/templates1.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();
