component output="false" displayname="Basic Controller" accessors="true" extends="com.easyxms.application.base" {

	$EasyModel = NullValue();
	$EasyData = StructNew();

	function setModel(any oModel) {
		$EasyModel = oModel;
	}

	function getModel() {
		return $EasyModel;
	}

	function getAll() {
		return $EasyData;
	}

	function getData(string name) {

		if (structKeyExists($EasyData, name)) {
			return 	$EasyData[name];
		}
		else
			return NullValue();
	}

	function setData(string name, any value) {
		$EasyData[name] = value;
	}

	function prepareModule() {

	}

	function preparePresenter() {

	}

	function onShow() {

	}

	function onEnd() {

	}
}