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
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
$id_user =  api_get_user_id();



$xpPro= null;
if (!empty($id_user)) {
    $sql2 = "SELECT * FROM $tables WHERE  id_user = $id_user";
    $result = Database::query($sql2);
    $xpPro = Database::fetch_array($result, 'ASSOC');
	
}

$form = new FormValidator('add', 'post', api_get_self().'?action='.$action.'&id_user='.$id_user);
$form->addText('date_begin', $plugin->get_lang('Date de début'));
$form->addText('date_end', $plugin->get_lang('Date de fin'));
$form->addText('title', $plugin->get_lang('Poste'), true);
$form->addText('nom_entreprise', $plugin->get_lang("Nom de l'entreprise"), true);
$form->addText('localisation', $plugin->get_lang('Lieu'), true);
$form->addTextarea('description', $plugin->get_lang('Description'), [], true);
$form->addButtonSave(get_lang('Save'));
$form->addButtonCancel(get_lang('Cancel'));



switch ($action) {
    case 'add':
        if ($form->validate($xpPro)) {
            $values = $form->getSubmitValues();
            $params = [
				'id_user' => api_get_user_id(),
				'type' => 2,
                'date_begin' => $values['date_begin'],
                'date_end' => $values['date_end'],
				'title' => $values['title'],
                'description' => $values['description'],
                'nom_entreprise' => $values['nom_entreprise'],
                'localisation'=> $values['localisation'],
                
            ];
            $result = Database::insert($tables, $params);
            if ($result) {
                Display::addFlash(Display::return_message(get_lang('Les expériences Professionnelles ont été ajoutés !!')));
            }
            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;

        case 'new_add':
            if ($form->validate($xpPro)) {
                $values = $form->getSubmitValues();
                $params = [
                    'id_user' => api_get_user_id(),
                    'type' => 2,
                    'date_begin' => $values['date_begin'],
                    'date_end' => $values['date_end'],
                    'title' => $values['title'],
                    'description' => $values['description'],
                    'nom_entreprise' => $values['nom_entreprise'],
                    'localisation'=> $values['localisation'],
                    
                ];
                $result = Database::insert($tables, $params);
                if ($result) {
                    Display::addFlash(Display::return_message(get_lang('Les expériences Professionnelles ont été ajoutés !!')));
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
				'date_begin' => $values['date_begin'],
				'date_begin' => $values['date_begin'],
                'date_end' => $values['date_end'],
				'title' => $values['title'],
                'description' => $values['description'],
                'nom_entreprise' => $values['nom_entreprise'],
                'localisation'=> $values['localisation'],
                
            ];
            Database::update($tables, $params, ['id_user = ?' => $id_user]);
            Display::addFlash(Display::return_message(get_lang('Mise à jour des expériences professionnelles  !!')));

            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;

        case 'new_edit':
            $form->setDefaults($xpPro);
            if ($form->validate()) {
                $values = $form->getSubmitValues();
                $params = [
                    'date_begin' => $values['date_begin'],
                    'date_begin' => $values['date_begin'],
                    'date_end' => $values['date_end'],
                    'title' => $values['title'],
                    'description' => $values['description'],
                    'nom_entreprise' => $values['nom_entreprise'],
                    'localisation'=> $values['localisation'],
                    
                ];
                Database::update($tables, $params, ['id_user = ?' => $id_user]);
    
                header('Location: '.api_get_self());
                header ('Location: experience_hobbies.php' );
                exit;
            }
            break;
		case 'delete':
        if (!empty($xpPro)) {
            Database::delete($tables, ['id = ?' => $id]);
            Display::addFlash(Display::return_message(get_lang('Expériences professionnelles supprimés !')));
            header('Location: '.api_get_self());
			header ('Location: cv.php' );
            exit;
        }
        break;

        case 'cancel':
        if (empty($xpPro)) {
            Database::delete($tables, ['id_user = ?' => $id_user]);
            header('Location: cv.php');
            exit;
        }
        break;
}

$tpl = new Template($plugin->get_lang('Expériences Professionnelles'));
$tpl->assign('xpPro', $xpPro);
$tpl->assign('form', $form->returnForm());
$tpl->assign('formulaire', $form->returnForm());
$content = $tpl->fetch('/'.$plugin->get_name().'/view/nav8.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();
