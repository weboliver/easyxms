component extends="com.easyxms.application.framework" {

	function onRequestStart() {

		var script_name = "";
		if (structKeyExists(url, "__easypath"))
			script_name = url.__easypath;

		super.onRequestStart(script_name);
	}

}