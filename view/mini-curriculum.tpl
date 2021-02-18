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
			<h1>Prénom <span class="blue">nom</span></h1>
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
			<div class="sec-gauche" id="forma-gauche">
				<p>{% for xpForm in xpForm %}{{ xpForm.date_begin}}{% endfor %}&nbsp-&nbsp{% for xpForm in xpForm %}{{ xpForm.date_end}}{% endfor %}<br/><span class="lieu">&nbsp{% for xpForm in xpForm %}{{ xpForm.lieu}}{% endfor %}</span></p>
			</div>
			<div class="sec-droite" >
				<p><span class="titre">&nbsp{% for xpForm in xpForm %}{{ xpForm.diplome }}{% endfor %}</span><br/>&nbsp{% for xpForm in xpForm %}{{ xpForm.etablissement}}{% endfor %}</p>
			</div>
			
			<br />
				{% for xpForm in xpForm %}
					
					
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=edit&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-success">
						<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
					</a>
					&nbsp
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=delete&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-danger">
						<span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
					</a><br />
					<br />
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=add&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-primary">
						<span class="fa fa-plus" aria-hidden="true"></span> {{ 'Ajouter une formation'|get_lang }}
					</a>
		  
				{% endfor %}
		</div>
		
		
		<div class="section">
			<h2>Expériences Professionnelles</h2>
			<div class="sec-gauche">
				<div id="exp-gauche">
					<p>&nbsp{% for xpPro in xpPro %}{{ xpPro.date_begin}}{% endfor %}&nbsp-&nbsp{% for xpPro in xpPro %}{{ xpPro.date_end}}{% endfor %}</p>
				</div>
			</div>
			<div class="sec-droite">
				<p><span class="titre"> &nbsp{% for xpPro in xpPro %}{{ xpPro.title }}{% endfor %}</span><br/>&nbsp{% for xpPro in xpPro %}{{ xpPro.description}}{% endfor %}</p>
			</div>
				
				<br />
				{% for xpPro in xpPro %}
				
					
				
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=edit&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-success">
						<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
					</a>
					&nbsp
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=delete&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-danger">
						<span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
					</a><br />
					<br />
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=add&{{ {'type': xpPro.type}|url_encode() }}" class="btn btn-primary">
						<span class="fa fa-plus" aria-hidden="true"></span> {{ 'Ajouter une expérience'|get_lang }}
					</a>
		  
				{% endfor %}
		</div>
		
		<div class="section">
			<h2>Centre d'intérêt</h2>
			<br/>
			<p><i class="fa fa-check" aria-hidden="true"></i>&nbsp{% for xpHobbies in xpHobbies %}{{ xpHobbies.title }}{% endfor %} : {% for xpHobbies in xpHobbies %}{{ xpHobbies.description}}{% endfor %}</p>
				
				<br />
				{% for xpHobbies in xpHobbies %}
				
					
					
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=edit&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-success">
						<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
					</a>
					&nbsp
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=delete&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-danger">
						<span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
					</a><br />
					<br />
					<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=add&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-primary">
						<span class="fa fa-plus" aria-hidden="true"></span> {{ 'Ajouter un hobbie'|get_lang }}
					</a>
  
				{% endfor %}
		
		</div>
	</div>
	<br />
	
	<center><a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=return&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-primary">
		<span class="fa fa-arrow-left" aria-hidden="true"></span> {{ 'Retour'|get_lang }}
	</a></center>
</body>
</html>