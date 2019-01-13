/**
 * Application.
 *
 * @author Oliver
 * @date 17.11.15
 **/
component accessors=true output=true persistent=false extends="custom.root.easyxms" {

	this.name = "EasyXMS_version_002";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,12,0,0);
	this.setClientCookies = true;
	this.compression = true;
	this.defaultroutes = 'com.easyxms.routes';
	/* This is Custom */
	this.customroutes = "custom.root.routes";
	this.datasource = "easyxms";
	this.ormenabled = true;
	this.debug = true;
	this.install = false;
	this.ormSettings = {cfclocation="#expandPath('/com/easyxms/orm/')#", dialect="MYSQL"};
}