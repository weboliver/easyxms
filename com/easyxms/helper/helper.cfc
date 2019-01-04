component output="false" displayname="Helper" extends="com.easyxms.application.base"  {

	/* Shortcuts begin with _Easy */
	$EasyXMS = Application.EasyXMS;
	$EasyConfig = $EasyXMS.GetConfig(cgi.SCRIPT_NAME);

	function setModel(any oModel) {
		$EasyModel = oModel;
	}

	function getModel() {
		return $EasyModel;
	}

	function setController(any oController) {
		$EasyController = oController;
	}

	function getController() {
		return $EasyController;
	}

}
