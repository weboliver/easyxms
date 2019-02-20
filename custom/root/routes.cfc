/**
 * Routes
 *
 * @author Oliver
 * @date 30.03.16
 **/
component accessors=true output=false persistent=false extends="com.easyxms.routes" {

	$EasyCustomRoutes = {
		"default" =	{
				"name" = "Homepage",
				"config" = "custom.root.configuration.homepage.config"
			},
		"/admin/index.cfm" =	{
				"contains" = "/admin",
				"name" = "Administration",
				"config" = "com.easyxms.configuration.admin.config"
			},
		"/_tests/index.cfm" =	{
				"contains" = "/_tests",
				"name" = "Tests",
				"config" = "custom.root.configuration._tests.config"
			},
		"/angular/" = {
			"contains" = "/angular",
			"name" = "Angular",
			"config" = "angular.configuration.config"
		},
		"/rest/" = {
			"contains" = "/rest",
			"name" = "Rest",
			"config" = "rest.configuration.config"
		},
		"*" =	{
				"contains" = "*",
				"component" = "custom.services.urls",
				"name" = "Return a Setup from DB",
				"config" = "custom.root.configuration.config"
			}

	};

	structappend($EasyRoutes, $EasyCustomRoutes, true);

	$EasyServices =
	{
		"GlobalConst" = {
			object="com.easyxms.services.const",
			init=true,
			initwith="init"
		},
		"DB" = {
			object="com.easyxms.services.db",
			init=true,
			initwith="init",
			objects = {
				"easyxms"="MYSQL"
			}
		}, /* Must be last Object*/
		"Installer" = {
			object="com.easyxms.services.installer",
			init=true,
			initwith="init"
		}
	};

	$EasyComponents =
	{
		"NavigationObject" = {
			object="com.easyxms.components.navigation",
			init=true,
			initwith=""
		},
		"PLUGINS" = {
			object= "com.easyxms.services.pluginsloader",
			init = true,
			initwith = "init",
			objects = {
				"pluginsfolder" = "/custom/plugins"
			}
		}
	};
}