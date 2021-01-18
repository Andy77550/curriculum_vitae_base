{{form}}

<div id="main">
</div>

<div class="data-table">
	<div class="heading">
		<h2>Informations Personnelles</h2>
	</div>
	<ul>
		<br>
		<li>
			{{ 'Date de Naissance' | get_plugin_lang('curriculum_vitae_base') }} : &nbsp{% for infoPerso in infoPerso %}{{ infoPerso.date_birthday}}{% endfor %}
		</li>
		
		<li>
			{{ 'Téléphone'  | get_plugin_lang('curriculum_vitae_base') }} : &nbsp{% for infoPerso in infoPerso  %}{{ infoPerso.phone}}{% endfor %}
		</li>
		
		<li>
			 {{  'Adresse'  | get_plugin_lang('curriculum_vitae_base') }} : &nbsp{% for infoPerso  in infoPerso  %}{{ infoPerso.address }}{% endfor %}
		</li>
		
		<li>
			{{ 'Métier Actuel' | get_plugin_lang('curriculum_vitae_base') }} : &nbsp{% for infoPerso  in infoPerso %}{{ infoPerso.skill_profil}}{% endfor %}
		</li>
		
		<br />
		{% for infoPerso in infoPerso %}
   
			<a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=edit&{{ {'id_user': infoPerso.id_user}|url_encode() }}" class="btn btn-success">
				<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
			</a>
			&nbsp
           
  
		{% endfor %}
	</ul>
</div>
	
<br />

<div class="data-table">
	<div class="heading">
		<h2>Expériences Professionnelles</h2>
	</div>
	<ul>
		<br>
		<li>
			{{ 'Date de début' | get_plugin_lang('curriculum_vitae_base') }} : &nbsp{% for xpPro in xpPro %}{{ xpPro.date_begin}}{% endfor %}
		</li>
		
		<li>
			{{ 'Date de fin' | get_plugin_lang('curriculum_vitae_base') }} : &nbsp{% for xpPro in xpPro %}{{ xpPro.date_end}}{% endfor %}
		</li>
		
		<li>
			 {{ 'Titre' | get_plugin_lang('curriculum_vitae_base') }} : &nbsp{% for xpPro in xpPro %}{{ xpPro.title }}{% endfor %}
		</li>
		
		<li>
			{{ 'Description' | get_plugin_lang('curriculum_vitae_base') }} : &nbsp{% for xpPro in xpPro %}{{ xpPro.description}}{% endfor %}
		</li>
		
		<br />
		{% for xpPro in xpPro %}
   
			<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=edit&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-success">
				<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
			</a>
			&nbsp
            <a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=delete&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-danger">
                <span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
            </a>
  
		{% endfor %}
	</ul>
</div>