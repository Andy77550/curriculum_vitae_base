{{form}}

<center>
	<a href="{{ _p.web_plugin }}curriculum_vitae_base/cv.php" class="btn btn-primary">
		<span class="fa fa-search fa-fw" aria-hidden="true"></span> {{ 'Voir le mini-cv'|get_lang }}
	</a>
</center>

	<a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php" class="btn btn-primary">
		<span class="fa fa-arrow-left" aria-hidden="true"></span> {{ 'Retour'|get_lang }}
	</a>

	<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=cancel&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-danger">
				 <center> {{ 'Cancel'|get_lang }}</center>
			</a>