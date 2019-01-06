/**
*
* @file  $TM_FILEPATH
* @author  $TM_FULLNAME
* @description
*
*/

component output="false" displayname="" extends="com.easyxms.configuration.easyconfig" {

	public function init(){
		getEasyPath();
		return this;
	}

	init();

	// set views to empty or "/" if you want to display the Site from root of the Server
	customsettings = {
		views = "/",
		templates = "/custom/views/templates/",
		starttemplate = "~v/index.cfm",
		"404" = "~v/templates/errorpages/_404.cfm",
		"403" = "~v/templates/errorpages/_403.cfm",
		"500" = "~v/templates/errorpages/_500.cfm",
		"show404" = true
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

	// These settings will always overwritten by their inheritors
	template = {
		name = "custom.root.modules.home"
	};

	controller = {
		name = "custom.root.controller.home"
	};

	model = {
		name = "custom.root.model.home"
	};
}