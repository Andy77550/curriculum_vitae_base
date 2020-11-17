{{ form }}

<table class="table table-hover  table-bordered data_table">
    <tr>
        <th scope="col"><center>
            {{ 'Date de début' | get_plugin_lang('curriculum_vitae_base') }}
        </center></th>
        <th scope="col"><center>
            {{ 'Date de fin' | get_plugin_lang('curriculum_vitae_base') }}
        <center></th>
		 <th scope="col"><center>
            {{ 'Titre' | get_plugin_lang('curriculum_vitae_base') }}
        <center></th>
		 <th scope="col"><center>
            {{ 'Description' | get_plugin_lang('curriculum_vitae_base') }}
        <center></th>
        <th scope="col"><center>
            {{ 'Actions' | get_lang }}
        <center></th>
    </tr>
{% for term in terms %}
    <tr>
        <td><center>
            {{ term.date_begin }}
			</center>
        </td>
        <td><center>
            {{ term.date_end}}
			</center>
        </td>
		 <td><center>
            {{ term.title }}
			</center>
        </td>
		 <td><center>
            {{ term.description }}
			</center>
        </td>
        <td><center>
            <a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=edit&{{ {'id': term.id}|url_encode() }}" class="btn btn-success">
                <span class="fa fa-edit fa-fw" aria-hidden="true"></span> {{ 'Edit'|get_lang }}
            </a>
            <a href="{{ _p.web_plugin }}curriculum_vitae_base/display-cv.php?action=delete&{{ {'id': term.id}|url_encode() }}" class="btn btn-danger">
                <span class="fa fa-times fa-fw" aria-hidden="true"></span> {{ 'Delete'|get_lang }}
            </a>
			</center>
        </td>
    </tr>
{% endfor %}
</table>