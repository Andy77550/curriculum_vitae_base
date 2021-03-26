{{form}}
    
      
            <div style=" position: absolute; top: 72%; right: 65%;">
                <a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=cancel&{{ {'id_user': xpPro.id_user}|url_encode() }}" class="btn btn-danger">
                    <center> {{ 'Cancel'|get_lang }}</center>
                </a>
            </div>

        <div style=" position: absolute; top: 72%; left: 75%;">
            {% if infoPerso.id_user %}
                <a href="{{ _p.web_plugin }}curriculum_vitae_base/experience_form.php" id="blue" class="btn btn-primary">
                <span class="fa fa-arrow-right" aria-hidden="true"></span> {{ 'Suivant'|get_lang }}
                </a>
            {% endif %}
	    </div>
