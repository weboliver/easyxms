/**
 * framework.cfc
 *
 * @author Oliver
 * @date 17.11.15
 **/
component accessors=false output=true persistent=false {

	function onApplicationStart() {
		createobject("com.easyxms.application.easyinit").init(this);
	}

	function onRequestStart() {

		var strctForm = {};
		var strctUrl = {};
		var script_name = cgi.SCRIPT_NAME;

		if (this.debug is "true" or not structKeyExists(Application, "EasyXMS") or isSimpleValue(Application.EasyXMS) or structCount(Application.EasyXMS) is 0 or Application.EasyXMS.testReInit(script_name)) {
			onApplicationStart();
		}

        lock scope="Application" throwontimeout="true" timeout="30" type="readonly" {

			if (Application.EasyXMS.testReRoute(script_name))
				Application.EasyXMS.setRoutes(this);
        }

		if (isdefined("Form"))
			strctForm = Form;

		if (isdefined("Url"))
			strctUrl = Url;

		if (left(script_name, 5) neq "/rest")
		{
			writeoutput(Application.EasyXMS.runRequest(script_name, strctUrl, strctForm));
			abort;
		}
		else
		{
			Application.EasyXMS.runRestRequest(script_name, strctUrl, strctForm);
		}

	}

	function onSessionStart() {

		if (not structkeyExists(Application, "EasyXMS")) {
			onApplicationStart();
		}

	    lock scope="Application" throwontimeout="true" timeout="30" type="readonly" {
			Application.EasyXMS.sessionStart();
	    }
	}

	function onError(struct Exception, string EventName) {

		if (structkeyExists(Application, "EasyXMS") and not isSimpleValue(Application.EasyXMS) and isStruct(Application.EasyXMS) and structCount(Application.EasyXMS)) {
	   	 	lock scope="Application" throwontimeout="true" timeout="30" type="readonly" {
				Application.EasyXMS.onError(Exception, EventName);
	   	 	}
		} else
			throw(Exception);
	}




}