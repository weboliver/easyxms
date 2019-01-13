/**
*
* @file  $easyconfig.cfc
* @author  Oliver Neumann
* @description Loads Configuration of easyxms
*
*/

component output="false" displayname="easyXMS System" extends="base" {

	property any _EasyRoutes;
	property struct _EasyPersistence;
	property struct _EasyServices;
	property boolean _EasyInstall;

    public any function init(any EasyRoutes){

        _EasyRoutes = EasyRoutes;
        _EasyPersistence = getRouter().getPersistentObjects();
		_EasyServices = {};
		_EasyInstall = false;
        return this;
    }

    public function setServices() {
    	var SingletonName = "";

    	for (SingletonName in _EasyPersistence) {
    		if (_EasyPersistence[SingletonName].init)
    			setService(SingletonName);
			else
				_EasyServices[SingletonName] = 0;

    	}
	}

	public function setInstall(boolean bInstall) {
		_EasyInstall = bInstall;
	}

	public boolean function getInstall() {
		return _EasyInstall;
	}

	private function setService(string SingletonName) {
		if (structKeyExists(_EasyPersistence[SingletonName], "initwith") and len(_EasyPersistence[SingletonName].initwith))
		{
			var sComponentCall = "createobject('";
			var strctObjects = {};
			if (structKeyExists(_EasyPersistence[SingletonName], "objects"))
				strctObjects = _EasyPersistence[SingletonName].objects;
			sComponentCall = sComponentCall & _EasyPersistence[SingletonName].object;
			sComponentCall = sComponentCall & "')." & _EasyPersistence[SingletonName].initwith & "(objects=strctObjects)" ;
			_EasyServices[SingletonName] = Evaluate(sComponentCall);

		}
		else
			_EasyServices[SingletonName] = createobject(_EasyPersistence[SingletonName].object);
    }

    public any function getService(string SingletonName) {

		if (not structKeyExists(_EasyServices, SingletonName) or (issimpleValue(_EasyServices[SingletonName])))
			setService(SingletonName);
    	return _EasyServices[SingletonName];
    }

    public struct function getServices() {

    	return _EasyServices;
    }

    public function setRoutes(any obj) {
       	var routes = "";
        lock scope="Application" throwontimeout="true" timeout="30" type="exclusive" {

			if (structKeyExists(obj, "customroutes"))
				routes = createObject(obj.customroutes).init();
			else
				routes = createObject(obj.defaultroutes).init();

			_EasyRoutes = routes;

    	}
    }

    public any function getRouter() {
    	return _EasyRoutes;
    }

    public boolean function existsRoute(string scriptname) {
    	return getRouter().existsRoute(scriptname);
    }

    public any function getRouteConfiguration(string scriptname) {
    	return getRouter().getConfig(scriptname);
    }

    public any function getConfig(string scriptname) {

		if (existsRoute(scriptname))
			return getRouteConfiguration(scriptname);
		else
        	return getRouteConfiguration("default");
    }

    public any function getController(string scriptname=cgi.script_name) {

    	return 	createObject(getConfig(scriptname).getControllerName());
    }

	public any function getTemplate(string scriptname) {

    	return 	createObject(getConfig(scriptname).getTemplateName(scriptname));
    }

    public any function getModel(string scriptname) {

    	return 	createObject(getConfig(scriptname).getModelName());
    }

    public boolean function testReRoute(string scriptname) {

        return testReInit(scriptname);
            return false;
    }

    public boolean function testReInit(string scriptname) {

        var config = getConfig(scriptname);
        var initPrm = config.getInitParameter();
        var initPass = config.getInitPassWord();
        if (structKeyExists(url, initPrm) and url[initPrm] is initPass)
            return true;
        else
            return false;
    }

	public string function runRequest(string scriptname=cgi.script_name, struct param = {}, struct frm = {}) {
		var oController = getController(scriptname);
		var oModel = getModel(scriptname);
		var sResult = "";
		oModel.setVar("__param", param);
		oModel.setVar("__frm", frm);
		oController.setModel(oModel);
		var Events = getconfig(scriptname).getevents();
		for (var e in Events) {
			evaluate("oController.#e#()");
		}
		var sFolder = getconfig(scriptname).getsetting("views");
		var sFile = sFolder & scriptname;
		var oTemplate = getTemplate(scriptname);
		oTemplate.setModel(oModel);
		oTemplate.setController(oController);
		if (fileExists(expandpath(sFile)))
			sResult = oTemplate.includetemplate(sFile);
		else if (getconfig(scriptname).getsetting("show404"))
			sResult = oTemplate.includetemplate(getConfig(scriptname).get404Template());
		else
			sResult = oTemplate.includetemplate(getConfig(scriptname).getstartTemplate());

		return sResult;
	}

	public function runRestRequest(string scriptname=cgi.script_name, struct param = {}, struct frm = {}) {
		var oController = getController(scriptname);
		var oModel = getModel(scriptname);
		var sResult = "";
		oModel.setVar("__param", param);
		oModel.setVar("__frm", frm);
		oController.setModel(oModel);
		var Events = getconfig(scriptname).getevents();
		for (var e in Events) {
			evaluate("oController.#e#()");
		}
	}

	public function endRequest() {
		// WriteOutput('End');
	}

	public function onError(struct Exception, string eventName ) {
		throw(Exception);
	}

	public function sessionStart() {


	}
}
