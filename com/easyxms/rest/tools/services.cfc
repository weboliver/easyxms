/**
 * Tools Services
 *
 * @author Oliver
 * @date 03.03.2019
 **/

 component accessors=true output=false persistent=false rest="true" restpath="tools" extends="com.easyxms.application.rest" {

	remote string function getName() httpmethod="GET" restpath="getname" produces="application/json" {

		return "Tools Services"

	}

}