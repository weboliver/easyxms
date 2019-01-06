/**
 * const
 *
 * @author Oliver
 * @date 08.04.16
 **/
component accessors=true output=false persistent=false  extends="com.easyxms.application.base" {

	public any function init() {

		setVar("Application_Name", "EasyXMS");
		setVar("Application_DataSource", "EasyXMS");
		setVar("Application_DataType", "MySQL");

		return this;
	}

}