{{form}}

&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp

	<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=cancel&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-danger">
		<center> {{ 'Cancel'|get_lang }}</center>
	</a>

<center>
	<a href="{{ _p.web_plugin }}curriculum_vitae_base/cv.php" class="btn btn-primary">
		<span class="fa fa-search fa-fw" aria-hidden="true"></span> {{ 'Voir le mini-cv'|get_lang }}
	</a>
</center>


	<a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=return&{{ {'id_user': infoPerso.id_user}|url_encode() }}" class="btn btn-primary">
		<span class="fa fa-arrow-left" aria-hidden="true"></span> {{ 'Retour'|get_lang }}
	</a>