/**
*
* @file  $TM_FILEPATH
* @author  $TM_FULLNAME
* @description
*
*/

component output="false" displayname="" extends="com.easyxms.configuration.easyadminconfig" {

	// set views to empty or "/" if you want to display the Site from root of the Server
	customsettings = {
		views = "/com/easyxms/views/pages",
		templates = "/com/easyxms/views/templates",
		starttemplate = "index.cfm",
		"404" = "~v/errorpages/_404.cfm",
		"403" = "~v/errorpages/_403.cfm",
		"500" = "~v/errorpages/_500.cfm",
		"show404" = false
	};

	structappend(settings, customsettings, true);

	javascript = {
		head = ["~t/parts/headers/javascript/standard.cfm"],
		foot = []
	};

	metainformation = {
		value = "~t/parts/headers/metadata/standard.cfm",
		lang = "de",
		charset="utf-8"
	};

	stylesheets = {
		head = ["~t/parts/headers/stylesheets/standard.cfm"],
		foot = []
	};

	presenter = {
		name = "com.easyxms.modules.admin.presenter"
	};

	controller = {
		name = "com.easyxms.modules.admin.controller"
	};

	model = {
		name = "com.easyxms.modules.admin.model"
	};

}