/**
 * Image Services
 *
 * @author Oliver
 * @date 03.03.2019
 **/

 component extends="com.easyxms.application.rest" {

	remote string function getName() httpmethod="GET" restpath="getname" produces="application/json" {

		return "Image Services"

	}

}