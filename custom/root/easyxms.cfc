component extends="com.easyxms.application.framework" {

	function onRequestStart() {

		var script_name = "";
		if (structKeyExists(url, "__easypath")) {
			script_name = url.__easypath;
			if (script_name is "/")
				script_name = "/index.cfm";
		}

		super.onRequestStart(script_name);


	}

}