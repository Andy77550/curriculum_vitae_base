{{ form }}

<div id="main">
	<center><img src="ressources/img/TC.jpg"></center>
</div>


<div class="data_table">
	<h2 id="heading">Informations Personnelles</h2>
	
		<ul>
			<br>
	        <li>
	        	 {{ 'Date de Naissance' | get_plugin_lang('curriculum_vitae_base') }}: &nbsp{% for term in terms %}{{ term.date_birthday }}{% endfor %}
	    	</li>
	        <li>
	        	 {{ 'Téléphone' | get_plugin_lang('curriculum_vitae_base') }}:  &nbsp{% for term in terms %}{{ term.phone}}{% endfor %}
	    	</li>    	
	    	<li>
	        	{{ 'Adresse' | get_plugin_lang('curriculum_vitae_base') }} :   &nbsp {% for term in terms %}{{ term.address }}{% endfor %}
	    	</li>
	    	<li>
	        	{{ 'Métier Actuel' | get_plugin_lang('curriculum_vitae_base') }}: &nbsp {% for term in terms %}{{ term.skill_profil}}{% endfor %}
	    	</li>
	    		<br />
	    		{% for term in terms %}
		    		<a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=edit&{{ {'id_user': term.id_user}|url_encode() }}" class="btn btn-success">
						<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
					</a>
				{% endfor %}
	    </ul>
	
</div>


<div class="data_table">
	<h2 id="heading">Expériences Professionnelles/Formations/Hobbies</h2>
	
		<ul>
			<br>
	        <li>
	        	 {{ 'Date de début' | get_plugin_lang('curriculum_vitae_base') }}: &nbsp{% for term in terms %}{{ term.date_begin }}{% endfor %}
	    	</li>
	        <li>
	        	 {{ 'Date de fin' | get_plugin_lang('curriculum_vitae_base') }}:  &nbsp{% for term in terms %}{{ term.date_end}}{% endfor %}
	    	</li>    	
	    	<li>
	        	{{ 'Titre' | get_plugin_lang('curriculum_vitae_base') }} :   &nbsp {% for term in terms %}{{ term.title }}{% endfor %}
	    	</li>
	    	<li>
	        	{{ 'Description' | get_plugin_lang('curriculum_vitae_base') }}: &nbsp {% for term in terms %}{{ term.description}}{% endfor %}
	    	</li>
	    		<br />
	    		{% for term in terms %}
		    		<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=edit&{{ {'id_user': term.id_user}|url_encode() }}" class="btn btn-success">
                		<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
            		</a>
				{% endfor %}
				&nbsp
				{% for term in terms %}
		    		<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=delete&{{ {'id_user': term.id_user}|url_encode() }}" class="btn btn-danger">
		                <span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
		            </a>
		    	{% endfor %}
	    </ul>
	
</div>

 