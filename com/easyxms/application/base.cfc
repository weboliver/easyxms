/**
*
* @file  $easyconfig.cfc
* @author  Oliver Neumann
* @description Loads Configuration of easyxms
*
*/

component output="false" displayname="easyXMS Basic Function" extends="simple"  {

	LocalScope = {};

	any function init() {
		return this;
	}

	struct function getBaseVariables() {

		var strctBaseVariables = {};
		for (var baseVariable in variables) {
			if (left(baseVariable, 1) is "$")
				strctBaseVariables[baseVariable] = variables[baseVariable];
		}
		return strctBaseVariables;
	}

	any function getEasyXMS() {
		return Application.EasyXMS;
	}

	function setProperty(string name, any obj) {
		evaluate("set#name#(obj)");
	}

	any function getGlobal(string name, any defaultvalue) {
		if (structKeyExists(arguments, "defaultvalue"))
			return Application.EasyXMS.getService("GlobalConst").getVar(name, defaultvalue);
		else
			return Application.EasyXMS.getService("GlobalConst").getVar(name);
	}

	// This Function provides a simple possibility to evaluate String or Structures, that are evaluated at runtime
	string function eval(string aValue, any parameters="", string onerror="#chr(60)#!-- NA --#chr(62)#", string hashtagBegin = '#chr(60)#@', string hashTagEnd="@#chr(62)#" ) {
		var sResult = aValue;
		var aMatches = [];
		var slocalVariable = "";
		var aIndex = 0;
		var iLen = 0;
		var args = {};

		/* if not Simple Parameter as string or numeric the parameters have to be refered by value */
		if (isSimpleValue(arguments.parameters)) {
			args.parameters = parameters;
		}
		else {
			/* coldfusion will pass by reference by default */
			args = duplicate(parameters);
		}

		structappend(local, args, true);

		if (aValue contains hashtagBegin) {
			/* While match replace the variable */
			aMatches = REMatch("#hashtagBegin#[^#hashTagEnd#]*#hashTagEnd#", arguments.aValue);
			iLen = ArrayLen(aMatches);

			for(aIndex = 1;aIndex lte iLen; aIndex = aIndex + 1)	{
				slocalVariable = replace(aMatches[aIndex], "#hashtagBegin#", "", "all");
				slocalVariable = replace(slocalVariable, "#hashtagEnd#", "", "all");
				try {
					/* If a Match was found the Parameter must exist in Parameters */
					slocalVariable = evaluate(slocalVariable);
				}
				catch(Any e) {
					/* Catch place error Variable into the string / argument */
					slocalVariable = onerror;
				}
				sResult = Replace(sResult, aMatches[aIndex], slocalVariable);
			}
		}
		return sResult;
	}

	function setVar(string name, any AnyData) {
		LocalScope[name] = AnyData;
	}

	any function getVar(string name, any defaultvalue) {
		if (existsVariable(name))
			return LocalScope[name];
		else if (structKeyExists(arguments, "defaultvalue"))
			return arguments.defaultvalue;
	}

	boolean function existsVariable(string name){
		return structKeyExists(LocalScope, name);
	}

	boolean function existsVar(string name){
		return structKeyExists(LocalScope, name);
	}

	struct function getLocalScope() {
		return LocalScope;
	}

	struct function getServices() {
		return Application.EasyXMS.getServices();
	}

	any function getService(string name) {
		return Application.EasyXMS.getService(name);
	}

	any function getrouter() {
		return Application.EasyXMS.getrouter();
	}

	struct function getsettings() {
		return getconfig().getsettings();
	}

	struct function getConfigSetup() {
		return getconfig().getConfigSetup();
	}

	struct function getroutes() {
		return getrouter().getroutes();
	}

};