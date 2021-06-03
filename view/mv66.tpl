<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css"  media="all" />
    <script src="resources/js/pdf.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
    <title>CV</title>
</head>
<body>
    <div class="col-md-offset-2 col-md-12" style="background: #E4E5E9;" id="wrapper">
        <div id="invoice">
            <div id="header">
                <div>
                    <h2 id="name">{% for infoPerso  in infoPerso %}{{ infoPerso.firstname}}{% endfor %} {% for infoPerso  in infoPerso %}{{ infoPerso.lastname}}{% endfor %}</h2>
                    <p id="underline"></p>
                    {% for infoPerso in infoPerso %}
                        {% if infoPerso.picture_uri == true %}

                          <center><img class="img-circle" src="http://localhost/chamilo-lms-1.11.14/app/upload/users/{{ infoPerso.id_user}}/{{ infoPerso.id_user}}/medium_{{ infoPerso.picture_uri}}" alt="{{ infoPerso.firstname}} {{ infoPerso.lastname}}" /><center> 
                            
                            {% else %}

                        {% endif %}
                    {% else %}

                    {% endfor %}
                  
                    <h5 id="web">{% for infoPerso  in infoPerso %}{{ infoPerso.skill_profil}}{% endfor %}</h5>

                    <div id="none">
                        {% for infoPerso in infoPerso %}
                        
                            <center><a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=edit&{{ {'id_user': infoPerso.id_user}|url_encode() }}" class="btn btn-success btn-success-1">
                                <span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ ''|get_lang }}
                            </a></center>
                        {% else %}
                            
                            <center><a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=new_add&{{ {'id_user': infoPerso.id_user}|url_encode() }}" class="btn btn-primary btncache">
                                        <span class="fa fa-plus" aria-hidden="true"></span> {{ ''|get_lang }}
                                    </a></center>
                        {% endfor %}
                    </div>

                    
                    
                </div>
            </div> <!--end header-->


            <div class="row">
                <div class="col-md-12">
                    <h4 id="exp">FORMATIONS</h4>
                    {% for xpForm in xpForm %}
                        <div id="experience">
                            <div id="exp1">
                                <div class="left">
                                  <i class="fa fa-square" aria-hidden="true"></i>
                                </div>

                                <div class="left-2">
                                    <p>{{ xpForm.date_begin}}&nbsp-&nbsp{{ xpForm.date_end}}</p>
                                </div>

                                <div class="right">
                                    <h4 id="ent">{{ xpForm.diplome }}</h4>
                                    <p class="italic">{{ xpForm.lieu}}</p>
                                    <p>{{ xpForm.etablissement}}</p>
                                </div>
                    
                                <div></div>
                                
                                <div id="vide">	
                                    <a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=edit&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-success btn-success-2 btncache">
                                        <span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ ''|get_lang }}
                                    </a>

                                      <a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=delete&{{ {'id': xpForm.id}|url_encode() }}" class="btn btn-danger btncache">
                                            <span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ ''|get_lang }}
                                      </a>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                    <div id="vide_form_add">
                        <a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php?action=new_add&{{ {'id_user': xpForm.id_user}|url_encode() }}" class="btn btn-primary btncache">
                                        <span class="fa fa-plus" aria-hidden="true"></span> {{ ''|get_lang }}
                                    </a>
                    </div>
                </div>
            </div><!--end row 1-->



            <div class="row">
                <div class="col-md-12">
                    <h4 id="exp">EXPERIENCES PROFESSIONNELLES</h4>
                    {% for xpPro in xpPro %}
                        <div id="experience">
                            <div id="exp1">
                                <div class="left">
                                   <i class="fa fa-square" aria-hidden="true"></i>
                                </div>
                                <div class="left-2">
                                    <span id="head">{{ xpPro.title }}</span>
                                    <p>{{ xpPro.date_begin}}&nbsp-&nbsp{{ xpPro.date_end}}</p>
                                </div>

                                <div class="right">
                                    <h4 id="ent">{{ xpPro.nom_entreprise}}</h4>
                                    <p class="italic">{{ xpPro.localisation}}</p>
                                    <p>{{ xpPro.description}}</p>
                                </div>

                                <div></div>

                                <div id="disparu">
                                
                                    <a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=edit&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-success btn-success-3  btncache">
                                        <span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ ''|get_lang }}
                                    </a>
                        

                                
                                    <a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=delete&{{ {'id': xpPro.id}|url_encode() }}" class="btn btn-danger  btncache">
                                        <span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ ''|get_lang }}
                                    </a>
                                </div>
                            </div><!--end section 1-->
                        </div>
                    {% endfor %}
                    <div id="vide_xp_add">
                        <a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=new_add&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-primary  btncache">
                            <span class="fa fa-plus" aria-hidden="true"></span> {{ ''|get_lang }}
                        </a>
                    </div>
                </div>
            </div><!--end row 1-->

            <div class="row">
            <div class="col-md-5">
                <h4 id="contacts">INFORMATIONS PERSONNELLES</h4>
                <div class="left">
                    <i class="fa fa-phone" aria-hidden="true"></i><span id="space"><a href="#">{% for infoPerso in infoPerso  %}{{ infoPerso.phone}}{% endfor %}</a></span>
                </div>
                <div>
                    <i class="fa fa-birthday-cake" aria-hidden="true"></i><span id="space"><a href="#">{% for infoPerso in infoPerso %}{{ infoPerso.date_birthday}}{% endfor %}</a></span>
                </div>
                <div>
                    <i class="fa fa-map-marker" aria-hidden="true"></i><span id="space"><a href="#">{% for infoPerso  in infoPerso  %}{{ infoPerso.address }}{% endfor %}</a></span>
                   
                </div>
            </div>


            
            <div class="col-md-7">
                <h4 id="interet">HOBBIES</h4>
                {% for xpHobbies in xpHobbies %}
                    <div class="skills">
                        <div id="titre">
                            <p>{{ xpHobbies.title }} : </p>
                        </div>
                        <div>
                            <p>{{ xpHobbies.description}}</p>
                        </div>
                        <div id="empty">
							
							
							<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=edit&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-success btn-success-4 btncache">
								<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ ''|get_lang }}
							</a>
							
							<a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=delete&{{ {'id': xpHobbies.id}|url_encode() }}" class="btn btn-danger btncache">
								<span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ ''|get_lang }}
							</a>
                        </div>
                    </div>
                {% endfor %}
                <div id="empty-1">
                     <a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_hobbies.php?action=add&{{ {'id_user': xpHobbies.id_user}|url_encode() }}" class="btn btn-primary btncache">
					<span class="fa fa-plus" aria-hidden="true"></span> {{ ''|get_lang }}
				</a>
                </div>
            </div>
        </div>
    </div>

        
        <button class="btn btn-primary" id="download"><span class="fa fa-download" aria-hidden="true"></span>Télécharger le CV</button>
        
        

   
</body>

</html>
