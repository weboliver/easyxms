component output="false" displayname="Basic Model" accessors="true"  extends="com.easyxms.helper.helper" {

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