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

	events = ["beforeModule","onModule","onModuleEnd"];

	module = {
		name = "rest.modules.standard.module"
	};

	controller = {
		name = "rest.modules.standard.controller"
	};

	model = {
		name = "rest.modules.standard.model"
	};

}