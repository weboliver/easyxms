/**
 * module
 *
 * @author Oliver
 * @date 04.02.19
 **/
component accessors=true output=false persistent=false extends="com.easyxms.application.base" {


	<!--- Global Variables in Template Handler Component --->
	$EasyXMS = Application.EasyXMS;
	$EasyJavascriptHeader = "";
	$EasyJavascriptFooter = "";
	$EasyMetaInformation = "";
	$EasyStyleSheetHeader = "";
	$EasyStyleSheetFooter = "";
	$EasyDocType = "";
	$EasyParts = {Home = "Homepage"};
	$EasyTemplate = [];
	$EasyCharset = "utf-8";
	$EasyServices = $EasyXMS.getServices();
	$EasyConfig= NullValue();
	$EasyModel = NullValue();
	$EasyController = NullValue();

	function setConfig(any oConfig) {
		$EasyConfig = oConfig;
	}

	function getConfig() {
		return $EasyConfig;
	}

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