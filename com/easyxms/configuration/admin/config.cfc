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
		views = "/com/easyxms/views/admin",
		templates = "/com/easyxms/views/templates",
		starttemplate = "~v/index.cfm",
		"404" = "~v/templates/errorpages/_404.cfm",
		"403" = "~v/templates/errorpages/_403.cfm",
		"500" = "~v/templates/errorpages/_500.cfm",
		"show404" = true
	};

	structappend(settings, customsettings, true);

	template = {
		name = "com.easyxms.modules.admin.admin"
	};

	controller = {
		name = "com.easyxms.controller.admin.admin"
	};

	model = {
		name = "com.easyxms.model.admin.admin"
	};

}