<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';
include("form-cv.php");

api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$table = 'experience_pro';
$sql2 = "SELECT * FROM $table ORDER BY id";
$result = Database::query($sql2);
$terms = Database::store_result($result, 'ASSOC');

$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

$term = null;
if (!empty($id)) {
    $sql2 = "SELECT * FROM $table WHERE id = $id";
    $result = Database::query($sql2);
    $term = Database::fetch_array($result, 'ASSOC');
    if (empty($term)) {
        api_not_allowed(true);
    }
}



$form = new FormValidator('add', 'post', api_get_self().'?action='.$action.'&id='.$id);
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
                'date_begin' => $values['date_begin'],
                'date_end' => $values['date_end'],
				'title' => $values['title'],
                'description' => $values['description'],
            ];
            $result = Database::insert($table, $params);
            if ($result) {
                Display::addFlash(Display::return_message(get_lang('Les expériences Professionnelles/Formations/Hobbies ont été ajoutés !!')));
            }
            header('Location: '.api_get_self());
            exit;
        }
        break;
    case 'edit':
        $form->setDefaults($term);
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
               'date_begin' => $values['date_begin'],
                'date_end' => $values['date_end'],
				'title' => $values['title'],
                'description' => $values['description'],
            ];
            Database::update($table, $params, ['id = ?' => $id]);
            Display::addFlash(Display::return_message(get_lang('Updated')));

            header('Location: '.api_get_self());
            exit;
        }
        break;
    case 'delete':
        if (!empty($term)) {
            Database::delete($table, ['id = ?' => $id]);
            Display::addFlash(Display::return_message(get_lang('Deleted')));
            header('Location: '.api_get_self());
            exit;
        }
        break;
}

$tpl = new Template($plugin->get_lang('Etape 2 : Expériences Professionnelles/Formations/Hobbies'));
$tpl->assign('terms', $terms);
$tpl->assign('form', $form->returnForm());
$content = $tpl->fetch('/'.$plugin->get_name().'/view/templates2.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();