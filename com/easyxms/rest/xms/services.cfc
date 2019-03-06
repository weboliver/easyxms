/**
 * services
 *
 * @author Oliver
 * @date 07.04.16
 **/
 component extends="com.easyxms.application.rest" {

	remote array function getEvents() httpmethod="GET" restpath="getEvents" produces="application/json" {

		return getEasyRequest().getConfig().getEvents();

	}

	remote struct function getController() httpmethod="GET" restpath="getController" produces="application/json" {

		return getEasyRequest().getConfig().getController();

	}

	remote struct function getModel() httpmethod="get" restpath="getModel" produces="application/json" {

		return getEasyRequest().getConfig().getModel();

	}

	remote struct function getSettings() httpmethod="GET" restpath="getSettings" produces="application/json" {

		return getEasyRequest().getConfig().getSettings();

	}

	remote struct function getRoutes() httpmethod="GET" restpath="getRoutes" produces="application/json" {

		return getEasyRequest().getRoutes();

	}

	remote struct function getVariables() httpmethod="GET" restpath="getVariables" produces="application/json" {

		return getEasyRequest().getBaseVariables();

	}

	remote string function getEasyResult() httpmethod="GET" restpath="getEasyResult" produces="application/json" {

		return getEasyRequest().getResult();

	}

	remote string function getVariables() httpmethod="GET" restpath="getVariables" produces="application/json" {

		return structKeyList(variables);

	}

	remote array function getElements(required string tablename restArgSource="path")  httpmethod="GET" restpath="getElements/{tablename}" produces="application/json" {
		var result = 0;
		try {
			result = ORMExecuteQuery("FROM #uCase(tablename)#");
		}
		catch(e) {
			result = arrayNew(1);
			arrayAppend(result, e.message);
		}
		return result;
	}

	remote array function getAtoms()  httpmethod="GET" restpath="getAtoms" produces="application/json" {
		
		var result = ORMExecuteQuery("FROM ATOMS");
		return result;

	}

	remote struct function getCGIVariables() httpmethod="GET" restpath="getCGIVariables" produces="application/json" {

		return cgi;

	}

}