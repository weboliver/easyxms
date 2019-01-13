/**
*
* @file  $easyconfig.cfc
* @author  Oliver Neumann
* @description Loads Configuration of easyxms
*
*/

component output="false" displayname="Configuration Loader" accessors="true" extends="easyconfig" {

	structappend(settings, customsettings, true);

	routes = "com.easyxms.services.routes";

}
