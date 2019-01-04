/**
 * Routes
 *
 * @author Oliver
 * @date 30.03.16
 **/
component accessors=true output=false persistent=false extends="com.easyxms.application.base" {

	$EasyRoutes =
	{
		"/admin/index.cfm" =	{
				name = "administration",
				config = "com.easyxms.configuration.easyadminconfig",
				path = "/admin/index.cfm"
			},
		"/admin/lucee/index.cfm" =	{
				name = "administration",
				config = "com.easyxms.configuration.easyadminconfig",
				path = "/admin/lucee/index.cfm"
			},
		"default" = {
				name = "default",
				config = "com.easyxms.configuration.easyconfig",
				path = "default"
			}

	};

	$EasyPersistent =
	{
		"GlobalConst" = {
			object="com.easyxms.services.const",
			init=true,
			initwith="init"
		},
		"Installer" = {
			object="com.easyxms.services.installer",
			init=true,
			initwith="init"
		},
		"DB" = {
			object="com.easyxms.services.db",
			init=true,
			initwith="init"
		}
	};

	struct function getRoutes() {

		return $EasyRoutes;
	}

	boolean function existsRoute(string script_name) {
		return structKeyExists($EasyRoutes, script_name);
	}

	any function getConfig(string script_name) {
		return createobject($EasyRoutes[script_name].config);
	}

	struct function getPersistentObjects() {

		return $EasyServices;
	}

	struct function getServices() {

		return $EasyServices;
	}

	numeric function existsRoute(string script_name) {

		if (structKeyExists($EasyRoutes, script_name))
			return true;
		var arrayF = StructFindKey($EasyRoutes, "CONTAINS", "all");
		if (ArrayLen(arrayF))
			for (var strctItem in arrayF) {
				if (findnocase(strctItem.owner.contains, script_name))
				{
						return true;
				}
			}

		return false;
	}

	any function getConfig(string script_name) {

		if (structKeyExists($EasyRoutes, script_name))
			return createobject($EasyRoutes[script_name].config);

		var arrayF = StructFindKey($EasyRoutes, "CONTAINS", "all");
		if (ArrayLen(arrayF))
			for (var strctItem in arrayF) {
				if (findnocase(strctItem.owner.contains, script_name))
				{
						return createobject(strctItem.owner.config);
				}
			}
	}

}