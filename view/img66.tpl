<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesh<heeet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css"  media="all" />
    <script src="resources/js/pdf.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
    <title>CV</title>

    <style>

        .container{
            padding: 0;
        }

       .membre-corps{
           background: white;
           text-align: center;
           box-shadow: 5px 5px 15px rgba(0, 0, 0, .3);
           border-radius: 10px;
           padding: 10px 0 0 0;
           margin: 15px 0;
       }
  
       .membre-btn{
           /* haut | droit | bas | gauche */
           margin: 20px 0;
           width: 100%;
           padding: 20px;
           border-radius: 0 0 10px 10px;
           background: #2980b9;
           transition: ease-in .5s all;

       }

       .btn-voir{
           color: white;
           font-size: 16px;
       }

       .membre-btn:hover{
           transition: ease-out .5s all;
           text-decoration: none;
           background: rgba(41,128,185, .7);
       }

       .info-name{
           font-size: 16px;
           margin-top: 15px;
           text-align: center;
           color: #2980b9;
           font-weight: 550;
       }

       .img-circle{
           margin: 0 auto;
       }



    </style>
</head>
<body>
    <div class="container">
        <div class="row">
        {% for infoPerso in infoPerso %}
            <div class="col-sm-4">
                <div class="membre-corps">
                    <div>
                        {%  if infoPerso.id_user == true %}
                            {%  if infoPerso.picture_uri == true %}
                                <img class="img-circle" src="http://localhost/chamilo-lms-1.11.14/app/upload/users/{{ infoPerso.id_user}}/{{ infoPerso.id_user}}/medium_{{ infoPerso.picture_uri}}" alt="{{ infoPerso.firstname}} {{ infoPerso.lastname}}" />
                                <p class="info-name">{{ infoPerso.firstname}} {{ infoPerso.lastname}}</p>
                            {% else %}
                                <p class="info-name">{{ infoPerso.firstname}} {{ infoPerso.lastname}}</p>
                             {% endif %}
                        {% else %}
                        {% endif %}
                    </div>
                    <div class="membre-btn">
                        <a href="{{ _p.web_plugin }}curriculum_vitae_base/cv_admin.php?{{ {'id_user': infoPerso.id_user}|url_encode() }}" class="btn-voir" >Regarder le cv</a>
                    </div>
                </div>
            </div>
        {% endfor %}

        {% for xpForm in xpForm %}
            <div class="col-sm-4">
                <div class="membre-corps">
                    <div>
                        {%  if infoPerso is defined %}
                        {% endif %}

                        {%  if xpForm.id_user == true %}
                            {%  if infoPerso.picture_uri == true %}
                                <img class="img-circle" src="http://localhost/chamilo-lms-1.11.14/app/upload/users/{{ infoPerso.id_user}}/{{ infoPerso.id_user}}/medium_{{ infoPerso.picture_uri}}" alt="{{ infoPerso.firstname}} {{ infoPerso.lastname}}" />
                                <p class="info-name">{{ infoPerso.firstname}} {{ infoPerso.lastname}}</p>
                            {% else %}
                                <p class="info-name">{{ infoPerso.firstname}} {{ infoPerso.lastname}}</p>
                             {% endif %}
                        {% else %}
                        {% endif %}
                    </div>
                    <div class="membre-btn">
                        <a href="{{ _p.web_plugin }}curriculum_vitae_base/cv_admin.php?{{ {'id_user': infoPerso.id_user}|url_encode() }}" class="btn-voir" >Regarder le cv</a>
                    </div>
                </div>
            </div>
        {% endfor %}
    </div>
</body>
