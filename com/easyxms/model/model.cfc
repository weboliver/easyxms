component output="false" displayname="Basic Model" accessors="true"  extends="com.easyxms.application.base" {

	$EasyController = NullValue();

	function setController(any oController) {
		$EasyController = oController;
	}

	function getController() {
		return $EasyController;
	}

	struct function getForm() {
		if (existsVar("__frm"))
			return LocalScope["__frm"];
		else
			return {};
	}

	struct function getUrl() {
		if (existsVar("__param"))
			return LocalScope["__param"];
		else
			return {};
	}

}