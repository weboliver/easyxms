/**
 * services
 *
 * @author Oliver
 * @date 07.04.16
 **/
component accessors=true output=false persistent=false rest="true" restpath="xms" extends="com.easyxms.application.request" {

	remote array function getStandardEvents() httpmethod="GET" restpath="getStandardEvents" produces="application/json" {

		return Request.$EasyRequest.getConfig().getEvents();

	}

	remote struct function getController() httpmethod="GET" restpath="getController" produces="application/json" {

		return Request.$EasyRequest.getConfig().getController();

	}

	remote struct function getModel() httpmethod="GET" restpath="getModel" produces="application/json" {

		return Request.$EasyRequest.getConfig().getModel();

	}

}