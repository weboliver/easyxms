/**
 * Workflow Services
 *
 * @author Oliver
 * @date 03.03.2019
 **/

 component extends="com.easyxms.application.rest" {

	remote string function getName() httpmethod="GET" restpath="getname" produces="application/json" {

		return "Workflow Services"

	}

	remote string function addWorkflow(required string category, required string module) httpmethod="GET" restpath="addworkflow" produces="application/json" {

		return "path_of_new_workflow"

	}

}