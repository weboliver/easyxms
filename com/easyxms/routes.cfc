/**
 * Routes
 *
 * @author Oliver
 * @date 30.03.16
 **/
component accessors=true output=false persistent=false extends="com.easyxms.application.base" {

	$EasyRoutes =
	{
		"default" = {
				name = "default",
				config = "com.easyxms.configuration.easyconfig"
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

	struct function getPersistentObjects() {

		return $EasyServices;
	}

	struct function getServices() {

		return $EasyServices;
	}

	any function getConfig(string scriptname) {

		if (structKeyExists($EasyRoutes, scriptname))
			return createobject($EasyRoutes[scriptname].config);

		var arrayF = StructFindKey($EasyRoutes, "CONTAINS", "all");
		if (ArrayLen(arrayF))
			for (var strctItem in arrayF) {
				if (findnocase(strctItem.owner.contains, scriptname))
				{
					return createobject(strctItem.owner.config);
				}
			}
	}

	numeric function existsRoute(string scriptname) {
		if (structKeyExists($EasyRoutes, scriptname))
			return true;
		var arrayF = StructFindKey($EasyRoutes, "CONTAINS", "all");
		if (ArrayLen(arrayF))
			for (var strctItem in arrayF) {
				if (findnocase(strctItem.owner.contains, scriptname))
				{
						return true;
				}
			}

		return false;
	}

}