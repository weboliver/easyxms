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
		_EasyComponents = {};
		_EasyInstall = false;
		_EasyRequest = createObject("com.easyxms.application.request");
        return this;
	}

	public function createRequest() {
		return duplicate(_EasyRequest);
	};

    public function setServices() {
    	var SingletonName = "";

    	for (SingletonName in _EasyPersistence) {
    		if (_EasyPersistence[SingletonName].init)
    			setService(SingletonName);
			else
				_EasyServices[SingletonName] = 0;

    	}
	}

	public function setComponents() {

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

    public struct function getComponents() {

    	return _EasyComponents;
    }

    public function setRoutes(any obj) {
       	var routes = "";
		if (structKeyExists(obj, "customroutes"))
			routes = createObject(obj.customroutes).init();
		else
			routes = createObject(obj.defaultroutes).init();
		_EasyRoutes = routes;
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

    public any function getController(any oConfig, string scriptname) {

    	return 	createObject(oConfig.getControllerName());
    }

	public any function getPresenter(any oConfig, string scriptname) {

    	return 	createObject(oConfig.getPresenterName(scriptname));
    }

    public any function getModel(any oConfig, string scriptname) {

    	return 	createObject(oConfig.getModelName());
    }

    public boolean function testReInit(string initPrm, string initPass) {

        if (structKeyExists(url, initPrm) and url[initPrm] is initPass)
            return true;
        else
            return false;
    }

	public string function runRequest(string scriptname, struct param = {}, struct frm = {}) {
		var oRequest = createRequest();
		var oConfig = getConfig(scriptname);
		var oController = getController(oConfig, scriptname);
		var oModel = getModel(oConfig, scriptname);
		var oPresenter = getPresenter(oConfig, scriptname);
		var sResult = "";
		oController.setModel(oModel);
		oRequest.setConfig(oConfig);
		oRequest.setController(oController);
		oRequest.setPresenter(oPresenter);
		oRequest.runRequest(scriptname, param, frm);
		return oRequest.getResult();
	}

	public function runRestRequest(string scriptname, struct param = {}, struct frm = {}) {
		var oRequest = createRequest();
		var oConfig = getConfig(scriptname);
		var oController = getController(oConfig, scriptname);
		var oModel = getModel(oConfig, scriptname);
		var sResult = "";
		oController.setModel(oModel);
		oRequest.setConfig(oConfig);
		oRequest.setController(oController);
		oRequest.runRequest(scriptname, param, frm);
		return oRequest;
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
