{{form}}

<div style="margin: 0 44%">
	<a href="{{ _p.web_plugin }}curriculum_vitae_base/cv.php" class="btn btn-primary">
		<span class="fa fa-search fa-fw" aria-hidden="true"></span> {{ 'Voir le mini-cv'|get_lang }}
	</a>
</div>

	<div style="position: absolute;top: 92%;right: 75%;">
		<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=new_edit&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-primary">
			<span class="fa fa-arrow-left" aria-hidden="true"></span> {{ 'Retour'|get_lang }}
		</a>
	</div>

	<div style="position: absolute;top: 73%;right: 65%;">
		<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=cancel&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-danger">
			<center> {{ 'Cancel'|get_lang }}</center>
		</a>
	</div>

	<div style="position: absolute;top: 92%;left: 75%;">
		{% if xpPro.id_user %}
			<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php" class="btn btn-primary">
			<span class="fa fa-arrow-right" aria-hidden="true"></span> {{ 'Suivant'|get_lang }}
			</a>
		{% endif %}
	</div>
