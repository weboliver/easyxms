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
		var scriptname = cgi.script_name;

		if (isdefined("Form"))
			strctForm = Form;

		if (isdefined("Url"))
			strctUrl = Url;

		if (this.debug is "true" or not structKeyExists(Application, "EasyXMS") or isSimpleValue(Application.EasyXMS) or structCount(Application.EasyXMS) is 0 or Application.EasyXMS.testReInit(this.initparameter, this.initpassword)) {
			onApplicationStart();
		}

		if (structKeyExists(this, "rewriteParameter") and structKeyExists(url, this.rewriteParameter))
			scriptname = url["#this.rewriteParameter#"];

		var testname = right(scriptname, 1);

		if (testname neq "/" and listlast(listlen(scriptname, ".")) lte 1)
			scriptname = scriptname & "/";

		testName = listlast(scriptname, "/");

		if (listlen(testname, ".") lte 1)
			scriptname = scriptname & this.standardDocument;

        lock scope="Application" throwontimeout="true" timeout="1" type="readonly" {
			Application.EasyXMS.setRoutes(this);
        }

		if (left(scriptname, 5) neq "/rest")
		{
			writeoutput(Application.EasyXMS.runRequest(scriptname, strctUrl, strctForm));
		}
		else
		{
			Application.EasyXMS.runRestRequest(scriptname, strctUrl, strctForm);
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