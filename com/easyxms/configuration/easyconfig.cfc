/**
*
* @file  $easyconfig.cfc
* @author  Oliver Neumann
* @description Loads Configuration of easyxms
*
*/

component output="false" displayname="Configuration Loader" accessors="true"  {

	Easypath = expandpath(".");

	routes = "com.easyxms.services.routes";

	settings = {
		"initroute" = "routes",
		"starttemplate" = '/index.cfm',
		"views" = '/com/easyxms/views/pages',
		"templates" = '/com/easyxms/views/templates',
		"404" = '~v/errorpages/_404.cfm',
		"403" = '~v/errorpages/_403.cfm',
		"500" = '~v/errorpages/_500.cfm',
		"show404" = true,
		"templateparameter" = "~t",
		"viewparameter" = "~v",
	};


	events = ["prepareModule","preparePresenter","onShow","onEnd"];

	customsettings = {

	};

	doctype = {
		value = "<!DOCTYPE HTML>"
	};

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

	controller = {
		name = "com.easyxms.controller.controller"
	};

	model = {
		name = "com.easyxms.model.model"
	};

	presenter = {
		name = "com.easyxms.presenter.presenter"
	};

	string function getPresenterName() {
		return presenter.name;
	}

	string function getControllerName() {
		return controller.name;
	}

	string function getModelName() {
		return model.name;
	}

	string function getTemplatePlaceHolder() {
		return getsettings().templateparameter;
	}

	string function getViewPlaceHolder() {
		return getsettings().viewparameter;
	}

    public string function getInitRoute() {

        return getsettings()['initroute'];
    }

	public function setsettings(struct newSettings = {}) {
		settings = duplicate(newSettings);
	}

	public struct function getsettings() {

		return settings;
	}

	public array function getEvents() {

		return events;
	}

	public struct function getJavascript() {

		return javascript;
	}

	public struct function getStylesheets() {

		return stylesheets;
	}

	public string function getStartTemplate() {
		return getSettings()['starttemplate'];
	}

	public string function get404Template() {
		return getSettings()['404'];
	}

	public string function get403Template() {
		return getSettings()['403'];
	}

	public string function get500Template() {
		return getSettings()['500'];
	}

	public string function getSetting(string name) {
		return getsettings()[name];
	}

	public struct function getcustomsettings() {

		return customsettings;
	}

	public struct function getController() {
		return controller;
	}

	public struct function getModel() {
		return model;
	}

	public string function getdoctype() {
		return doctype.value;
	}

	public string function getMetaInformation() {
		return metainformation.value;
	}

	public string function getLang() {
		return metainformation.lang;
	}

	public any function getRoutesHandler() {

		return createObject(routes);

	}

	public string function getCharset() {
		return 	metainformation.charset;
	}

	public function getConfigSetup() {
		return variables;
	}

	function getEasyPath() {
		Easypath = expandpath(getcurrentTemplatePath());
	}
}
