/**
 * config
 *
 * @author Oliver
 * @date 03.03.2019
 **/


component output="false" displayname="" extends="com.easyxms.configuration.easyconfig" {

	public function init(){
		getEasyPath();
		return this;
	}

	init();

	events = ["checkCredentials"];

	module = {
		name = "com.easyxms.rest.security.modules.login.module"
	};

	model = {
		name = "com.easyxms.rest.security.modules.login.model"
	};

}