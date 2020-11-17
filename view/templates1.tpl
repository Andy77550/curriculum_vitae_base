{{ form }}

<table class="table table-hover table-bordered data_table">
    <tr>
        <th scope="col"><center>
            {{ 'Date de Naissance' | get_plugin_lang('curriculum_vitae_base') }}
        </center></th>
        <th scope="col"><center>
            {{ 'Téléphone' | get_plugin_lang('curriculum_vitae_base') }}
			<center>
        </th>
		 <th scope="col"><center>
            {{ 'Adresse' | get_plugin_lang('curriculum_vitae_base') }}
        </th>
		 <th scope="col"><center>
            {{ 'Métier Actuel' | get_plugin_lang('curriculum_vitae_base') }}
			</center>
        </th>
        <th scope="col"><center>
            {{ 'Actions' | get_lang }}
			</center>
        </th>
    </tr>
{% for term in terms %}
    <tr>
        <td><center>
            {{ term.date_birthday }}
			</center>
        </td>
        <td><center>
            {{ term.phone}}
			</center>
        </td>
		 <td><center>
            {{ term.address }}
			</center>
        </td>
		 <td><center>
            {{ term.skill_profil}}
			</center>
        </td>
        <td>
			<center>
				<a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=edit&{{ {'id': term.id}|url_encode() }}" class="btn btn-success">
					<span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
				</a>
				<a href="{{ _p.web_plugin }}curriculum_vitae_base/form-cv.php?action=delete&{{ {'id': term.id}|url_encode() }}" class="btn btn-danger">
					<span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
				</a>
			</center>
        </td>
    </tr>
{% endfor %}
</table>