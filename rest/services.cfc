/**
 * services
 *
 * @author Oliver
 * @date 07.04.16
 **/
component accessors=true output=false persistent=false rest="true" restpath="xms" extends="com.easyxms.helper.helper" {

	remote array function getStandardEvents() httpmethod="GET" restpath="getStandardEvents" produces="application/json" {

		return $EasyConfig.getevents();
	}

}