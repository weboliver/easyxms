/**
 * installer
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent=false  extends="com.easyxms.application.base" {

	any function init() {

		return this;
	}

	boolean function isSetup() {

		return true;

	}

	boolean function needsUpdate() {

		return false;

	}

	string function getVersion() {

		return "0.01";

	}



}