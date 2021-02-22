<?php
/* For licensing terms, see /license.txt */

/**
 * Class curriculum_vitae_base.
 */
class curriculum_vitae_base extends Plugin
{
    public $table = 'plugin_curriculum_vitae_base';
    /**
     * curriculum_vitae_base constructor.
     */
    protected function __construct()
    {
        parent::__construct(
            '1.0',
            'Andy Vespuce',
            [
                'enable_plugin_curriculum_vitae_base' => 'boolean',
            ]
        );
    }

    /**
     * @return curriculum_vitae_base|null
     */
    public static function create()
    {
        static $result = null;

        return $result ? $result : $result = new self();
    }
	

	
	

     /**
     * install the plugin structure.
     */
    public function install()
    {
        $sql = "CREATE TABLE IF NOT EXISTS plugin_curriculum_vitae_base (
                id INT NOT NULL AUTO_INCREMENT,
				id_user INT NOT NULL,
				date_birthday DATE NOT NULL,
				phone VARCHAR(50) NOT NULL,
                address VARCHAR(50) NOT NULL,
                skill_profil VARCHAR(255) NOT NULL,
                PRIMARY KEY (id));
        ";
        Database::query($sql);
		
		$sql2 = "CREATE TABLE IF NOT EXISTS experience_pro (
                id INT NOT NULL AUTO_INCREMENT,
				id_user INT NOT NULL,
				type INT NOT NULL,
				date_begin VARCHAR(50) NOT NULL,
				date_end VARCHAR(50) NOT NULL,
                title VARCHAR(255) NOT NULL,
				description VARCHAR(512) NOT NULL,
                PRIMARY KEY (id));
        ";
        Database::query($sql2);

        $sql3 = "CREATE TABLE IF NOT EXISTS experience_form (
                id INT NOT NULL AUTO_INCREMENT,
                id_user INT NOT NULL,
                type INT NOT NULL,
                date_begin VARCHAR(50) NOT NULL,
                date_end VARCHAR(50) NOT NULL,
                diplome VARCHAR(255) NOT NULL,
                lieu VARCHAR(255) NOT NULL,
                etablissement VARCHAR(255) NOT NULL,
                PRIMARY KEY (id));
        ";
        Database::query($sql3);

         $sql4 = "CREATE TABLE IF NOT EXISTS experience_hobbies (
                id INT NOT NULL AUTO_INCREMENT,
                id_user INT NOT NULL,
                type INT NOT NULL,
                title VARCHAR(255) NOT NULL,
                description VARCHAR(512) NOT NULL,
                PRIMARY KEY (id));
        ";
        Database::query($sql4);
    }

     /**
     * Uninstall the plugin structure.
     */
    public function uninstall()
    {
        $sql = "DROP TABLE IF EXISTS plugin_curriculum_vitae_base";
		$sql2 = "DROP TABLE IF EXISTS experience_pro ";
        $sql3 = "DROP TABLE IF EXISTS experience_form ";
        $sql4 = "DROP TABLE IF EXISTS experience_hobbies ";
        Database::query($sql);
		Database::query($sql2);
        Database::query($sql3);
        Database::query($sql4);
    }
}