{{form}}

	<div style="margin: 0 44%">
		<a href="{{ _p.web_plugin }}curriculum_vitae_base/cv.php" class="btn btn-primary">
			<span class="fa fa-search fa-fw" aria-hidden="true"></span> {{ 'Voir le mini-cv'|get_lang }}
		</a>
	</div>
	
	<div style="position: absolute;top: 90.5%;right: 75%;">
		<a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=new_edit&{{ {'id_user': infoPerso.id_user}|url_encode() }}" class="btn btn-primary">
					<span class="fa fa-arrow-left" aria-hidden="true"></span> {{ 'Retour'|get_lang }}
		</a>
	</div>

	<div style="position: absolute;top: 67.6%;right: 65%;">
		<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=cancel&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-danger">
					<center> {{ 'Cancel'|get_lang }}</center>
				</a>
	</div>

	<div style="position: absolute;top: 90.5%;left: 75%;">
		{% if xpForm.id_user %}
			<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php" class="btn btn-primary">
			<span class="fa fa-arrow-right" aria-hidden="true"></span> {{ 'Suivant'|get_lang }}
			</a>
		{% endif %}
	</div>
