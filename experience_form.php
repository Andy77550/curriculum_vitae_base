<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';


//api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$tables = 'experience_form';
$sql3 = "SELECT * FROM $tables ";
$result = Database::query($sql3);
$xpForm = Database::store_result($result, 'ASSOC');

$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
$id_user =  api_get_user_id();

$xpForm= null;
if (!empty($id_user)) {
    $sql3 = "SELECT * FROM $tables WHERE id_user = $id_user";
    $result = Database::query($sql3);
    $xpForm = Database::fetch_array($result, 'ASSOC');
	
}



$form = new FormValidator('add', 'post', api_get_self().'?action='.$action.'&id_user='.$id_user);
$form->addText('date_begin', $plugin->get_lang('Date de début'));
$form->addText('date_end', $plugin->get_lang('Date de fin'));
$form->addText('diplome', $plugin->get_lang('Diplôme'), true);
$form->addText('lieu', $plugin->get_lang('Lieu'), true);
$form->addText('etablissement', $plugin->get_lang('Etablissement'), true);
$form->addButtonSave(get_lang('Save'));
$form->addButtonCancel(get_lang('Cancel'));

switch ($action) {
    case 'add':
        if ($form->validate()) {
            $values = $form->getSubmitValues();
            $params = [
		        'id_user' => api_get_user_id(),
				'type' => 1,
                'date_begin' => $values['date_begin'],
                'date_end' => $values['date_end'],
		        'diplome' => $values['diplome'],
                'lieu' => $values['lieu'],
			    'etablissement' => $values['etablissement'],
            ];
            $result = Database::insert($tables, $params);
            if ($result) {
                Display::addFlash(Display::return_message(get_lang('La formation a été ajoutée !!')));
            }
            header('Location: '.api_get_self());
			header('Location: cv.php' );
            exit;
        }
        break;
		case 'new_add':
			if ($form->validate()) {
				$values = $form->getSubmitValues();
				$params = [
					'id_user' => api_get_user_id(),
					'type' => 1,
					'date_begin' => $values['date_begin'],
					'date_end' => $values['date_end'],
					'diplome' => $values['diplome'],
					'lieu' => $values['lieu'],
					'etablissement' => $values['etablissement'],
				];
				$result = Database::insert($tables, $params);
				if ($result) {
					Display::addFlash(Display::return_message(get_lang('La formation a été ajoutée !!')));
				}
				header('Location: '.api_get_self());
				header('Location: cv.php' );
				exit;
			}
			break;
		
		
		case 'edit':
			$form->setDefaults($xpForm);
			if ($form->validate()) {
				$values = $form->getSubmitValues();
				$params = [
					'date_begin' => $values['date_begin'],
					'date_end' => $values['date_end'],
					'diplome' => $values['diplome'],
					'lieu' => $values['lieu'],
					'etablissement' => $values['etablissement'],
				];
				Database::update($tables, $params, ['id_user = ?' => $id_user]);
				Display::addFlash(Display::return_message(get_lang('Mise à jour de la formation !!')));

				header('Location: '.api_get_self());
				header ('Location: cv.php' );
				exit;
			}
		break;

		case 'new_edit':
			$form->setDefaults($xpForm);
			if ($form->validate()) {
				$values = $form->getSubmitValues();
				$params = [
					'date_begin' => $values['date_begin'],
					'date_end' => $values['date_end'],
					'diplome' => $values['diplome'],
					'lieu' => $values['lieu'],
					'etablissement' => $values['etablissement'],
				];
				Database::update($tables, $params, ['id_user = ?' => $id_user]);

				header('Location: '.api_get_self());
				header ('Location: display-cv.php' );
				exit;
			}
		break;

			
		case 'delete':
			if (!empty($xpForm)) {
				Database::delete($tables, ['id = ?' => $id]);
				Display::addFlash(Display::return_message(get_lang('Formation supprimée !')));
				header('Location: '.api_get_self());
				header('Location: cv.php' );
				exit;
			}
		break;

		case 'cancel':
			if (empty($xpForm)) {
				Database::delete($tables, ['id_user = ?' => $id_user]);
				header('Location: cv.php');
				exit;
			}
		break;
}

$tpl = new Template($plugin->get_lang('Formation'));
$tpl->assign('xpForm', $xpForm);
$tpl->assign('form', $form->returnForm());
$content = $tpl->fetch('/'.$plugin->get_name().'/view/nl8.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();
