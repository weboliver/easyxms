/**
 * easyinit
 *
 * @author Oliver
 * @date 30.03.16
 **/
component accessors=true output=false persistent=false {

    public any function init(any obj) {

		var routes = "";
		if (structKeyExists(obj, "customroutes"))
			routes = createObject(obj.customroutes);
		else
			routes = createObject(obj.defaultroutes);

		lock scope="Application" throwontimeout="true" timeout="30" type="exclusive" {
        	// ORMReload();
			Application.EasyXMS = 0;
			Application.EasyXMS = createObject('com.easyxms.application.easyxms').init(routes);
			Application.EasyXMS.setServices();
			Application.EasyXMS.setRoutes(obj);
			if (structKeyExists(obj, "install") and obj.install)
				Application.EasyXMS.setInstall(obj.install);
			}
			restInitApplication( dirPath=expandPath('/com/easyxms/rest'),serviceMapping='/easy');
    }
}