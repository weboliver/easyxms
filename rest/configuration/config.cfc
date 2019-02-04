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

	controller = {
		name = "rest.controller.controller"
	};

	model = {
		name = "rest.model.model"
	};

}