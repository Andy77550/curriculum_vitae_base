<?php
/* For licensing terms, see /license.txt */

require_once __DIR__.'/../../main/inc/global.inc.php';
require_once __DIR__.'/curriculum_vitae_base.php';


//api_protect_admin_script();

$plugin = curriculum_vitae_base::create();

$table = 'plugin_curriculum_vitae_base';
$tables = 'experience_pro';
$sql = "SELECT * FROM $table,$tables WHERE $table.id = $tables.id";
$result = Database::query($sql);
$terms = Database::store_result($result, 'ASSOC');


$action = isset($_GET['action']) ? Security::remove_XSS($_GET['action']) : 'add';
$id_user =  api_get_user_id();

$term = null;
if (!empty($id_user)) {
    $sql = "SELECT * FROM $table,$tables WHERE $table.id = $tables.id";
    $result = Database::query($sql);
    $term = Database::fetch_array($result, 'ASSOC');
   
}



$tpl = new Template($plugin->get_lang('Vue du mini-cv'));
$tpl->assign('terms', $terms);
$content = $tpl->fetch('/'.$plugin->get_name().'/view/vouke.tpl');
// Assign into content
$tpl->assign('content', $content);
// Display
$tpl->display_one_col_template();







