/**
 * Security Services
 *
 * @author Oliver
 * @date 03.03.2019
 **/

 component accessors=true output=false persistent=false rest="true" restpath="security" extends="com.easyxms.application.rest" {

	remote string function getName() httpmethod="GET" restpath="getname" produces="application/json" {

		return "Security Services"

	}

	remote string function login(required string username restArgSource="path", required string password restArgSource="path") httpmethod="GET" restpath="login/{username}/{password}" produces="application/json" {

		return getEasyRequest().getModule().getCredentials(username, password);
	}

}