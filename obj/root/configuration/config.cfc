/**
*
* @file  $TM_FILEPATH
* @author  $TM_FULLNAME
* @description
*
*/

component output="false" displayname="" extends="com.easyxms.configuration.easyconfig" {

	public function init(){
		getpath();
		return this;
	}

	init();

	customsettings = {
		views = "",
		templates = "/templates",
		starttemplate = "~/index.cfm",
		"404" = "~/templates/errorpages/_404.cfm",
		"403" = "~/templates/errorpages/_403.cfm",
		"500" = "~/templates/errorpages/_500.cfm",
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
		name = "obj.root.modules.home"
	};

	controller = {
		name = "obj.root.controller.home"
	};

	model = {
		name = "obj.root.model.home"
	};
}