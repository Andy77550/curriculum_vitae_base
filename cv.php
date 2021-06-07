<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';


//api_protect_admin_script();


$plugin = curriculum_vitae_base::create();


$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id_user =  api_get_user_id();


if (!empty($id_user)) {
	
	//Récupérations des informations personnelles
	
	$sql = "SELECT * FROM plugin_curriculum_vitae_base WHERE id_user = $id_user";
    $result = Database::query($sql);
    $infoPerso = Database::store_result($result, 'ASSOC');
	
	//Récupérations des expériences professionnelles
	$sql = "SELECT * FROM experience_pro WHERE id_user = $id_user";
	$result = Database::query($sql);
	$xpPro = Database::store_result($result, 'ASSOC');

	//Récupérations des formations
	$sql = "SELECT * FROM experience_form WHERE id_user = $id_user";
	$result = Database::query($sql);
	$xpForm = Database::store_result($result, 'ASSOC');

	//Récupérations des hobbies
	$sql = "SELECT * FROM experience_hobbies WHERE id_user = $id_user";
	$result = Database::query($sql);
	$xpHobbies = Database::store_result($result, 'ASSOC');


}

$tpl = new Template($plugin->get_lang('Vue du mini-cv'));
$tpl->assign('infoPerso',$infoPerso);
$tpl->assign('xpPro',$xpPro);
$tpl->assign('xpForm',$xpForm);
$tpl->assign('xpHobbies',$xpHobbies);

$content = $tpl->fetch('/'.$plugin->get_name().'/view/mv66.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();


