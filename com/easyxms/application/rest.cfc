component output="false" displayname="Request" extends="com.easyxms.application.base"  {

	init();

	function init() {

		$EasyRequest = Application.EasyXMS.runRestRequest(cgi.request_url, url, form);
	}

	function getEasyRequest() {
		return $EasyRequest;
	}

}