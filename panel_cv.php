<?php
/* For licensing terms, see /license.txt */
use ChamiloSession as Session;

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';


api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id_user =  api_get_user_id();
$sessionId = api_get_session_id();

if (!empty($id_user)) {
	
	//Récupérations des informations personnelles de tous les utilisateurs
	
	$sql = "SELECT * FROM plugin_curriculum_vitae_base ";
    $result = Database::query($sql);
    $result->execute();
    $infoPerso = $result->fetchAll(PDO::FETCH_ASSOC);
    //print_r($infoPerso);
   
	//Récupérations des expériences professionnelles tous les utilisateurs
	$sql = "SELECT * FROM experience_pro";
	$result = Database::query($sql);
	$xpPro = $result->fetchAll(PDO::FETCH_ASSOC);
    //print_r($xpPro);

	//Récupérations des expériences professionnelles tous les utilisateurs
	$sql = "SELECT * FROM experience_form";
	$result = Database::query($sql);
	$xpForm = $result->fetchAll(PDO::FETCH_ASSOC);
    //print_r($xpForm);

	//Récupérations des expériences professionnelles tous les utilisateurs
	$sql = "SELECT * FROM experience_hobbies";
	$result = Database::query($sql);
	$xpHobbies = $result->fetchAll(PDO::FETCH_ASSOC);
    //print_r($xpHobbies);


}

$tpl = new Template($plugin->get_lang('Vue des mini-cv utilisateurs'));
$tpl->assign('infoPerso',$infoPerso);
$tpl->assign('xpPro',$xpPro);
$tpl->assign('xpForm',$xpForm);
$tpl->assign('xpHobbies',$xpHobbies);

$content = $tpl->fetch('/'.$plugin->get_name().'/view/img63.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();



