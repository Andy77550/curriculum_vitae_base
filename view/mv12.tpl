<head>
	<title>CV</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="page">

		<div class="section">
			<h1>{% for infoPerso  in infoPerso %}{{ infoPerso.firstname}}{% endfor %} <span class="blue">{% for infoPerso  in infoPerso %}{{ infoPerso.lastname}}{% endfor %}</span></h1>
			<h3>{% for infoPerso  in infoPerso %}{{ infoPerso.skill_profil}}{% endfor %}</h3>
			<ul class="ligne">
				<br />
				<li class="data"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp{% for infoPerso in infoPerso  %}{{ infoPerso.phone}}{% endfor %}</li>
				<li class="data"><i class="fa fa-birthday-cake" aria-hidden="true"></i>&nbsp{% for infoPerso in infoPerso %}{{ infoPerso.date_birthday}}{% endfor %}</li>
				<li class="data"><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp{% for infoPerso  in infoPerso  %}{{ infoPerso.address }}{% endfor %}</li>
			</ul>
			<br />
			{% for infoPerso in infoPerso %}
	   
				<center><a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=edit&{{ {'id_user': infoPerso.id_user}|url_encode() }}" class="btn btn-success">
					<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
				</a></center>
			{% endfor %}
		</div>



		<div class="section">
			<h2>Formations</h2>
            	<br>
            {% for xpForm in xpForm %}
                <div class="sec-gauche" id="forma-gauche">
                    <p>{{ xpForm.date_begin}}&nbsp-&nbsp{{ xpForm.date_end}}<br/><span class="lieu">&nbsp{{ xpForm.lieu}}</span></p>
                </div>
                <div class="sec-droite" >
                    <p><span class="titre"><i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp{{ xpForm.diplome }}</span><br/>&nbsp{{ xpForm.etablissement}}</p>
                </div>
                
                <br />
					
					
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=edit&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-success">
						<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
					</a>
					&nbsp
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=delete&{{ {'id': xpForm.id}|url_encode() }}" class="btn btn-danger">
						<span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
					</a><br />
					<br />
		  
			{% endfor %}

                	<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=add&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-primary">
						<span class="fa fa-plus" aria-hidden="true"></span> {{ 'Ajouter une formation'|get_lang }}
					</a>
		</div>
		


		
		<div class="section">
			<h2>Expériences Professionnelles</h2>
            	<br>
            {% for xpPro in xpPro %}
                <div class="sec-gauche">
                    <div id="exp-gauche">
                        <p>&nbsp{{ xpPro.date_begin}}&nbsp-&nbsp{{ xpPro.date_end}}<br/><span class="lieu">&nbsp{{ xpPro.nom_entreprise}}</span><br/><span class="lieu">&nbsp{{ xpPro.localisation}}</span></p>
                    </div>
                </div>
                <div class="sec-droite">
                    <p><span class="titre"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp{{ xpPro.title }}</span><br/>&nbsp{{ xpPro.description}}</p>
                </div>
				
				<br><br>
				
				
					
				
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=edit&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-success">
						<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
					</a>
					&nbsp
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=delete&{{ {'id': xpPro.id}|url_encode() }}" class="btn btn-danger">
						<span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
					</a><br />
					<br />
		  
				{% endfor %}

                <a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=add&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-primary">
						<span class="fa fa-plus" aria-hidden="true"></span> {{ 'Ajouter une expérience'|get_lang }}
					</a>
		</div>



		
		<div class="section">
			<h2>Centre d'intérêt</h2>
			<br/>
            {% for xpHobbies in xpHobbies %}
                <br />
                <p><i class="fa fa-check" aria-hidden="true"></i>&nbsp{{ xpHobbies.title }} : {{ xpHobbies.description}}</p>
                    
                    <br />
				
				
					
					
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=edit&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-success">
						<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
					</a>
					&nbsp
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=delete&{{ {'id': xpHobbies.id}|url_encode() }}" class="btn btn-danger">
						<span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
					</a><br />
					<br />
				
  
				{% endfor %}

					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=add&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-primary">
						<span class="fa fa-plus" aria-hidden="true"></span> {{ 'Ajouter un hobbie'|get_lang }}
					</a>
		
		</div>

	</div>
        <br><br>
       <center><a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=new_edit&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-primary">
		<span class="fa fa-arrow-left" aria-hidden="true"></span> {{ 'Retour'|get_lang }}
	    </a></center>

</body>
</html>