<?php
/* For license terms, see /license.txt */

require_once __DIR__.'/curriculum_vitae_base.php';

if (!api_is_platform_admin()) {
    die('You must have admin permissions to install plugins');
}
curriculum_vitae_base::create()->install();

