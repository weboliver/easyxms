/**
 * Routes
 *
 * @author Oliver
 * @date 30.03.16
 **/
component accessors=true output=false persistent=false extends="com.easyxms.routes" {

	$EasyCustomRoutes = {
		"/index.cfm" =	{
				"name" = "Homepage",
				"config" = "custom.root.configuration.homepage.config",
				"path" = "/index.cfm"
			},
		"/news/index.cfm" =	{
				"name" = "News",
				"config" = "custom.root.configuration.news.config",
				"path" = "/news/index.cfm"
			},
		"/admin/" =	{
				"contains" = "/admin/",
				"name" = "Administration",
				"config" = "custom.root.configuration.admin.config",
				"path" = ""
			},
		"*" =	{
				"component" = "custom.services.urls",
				"name" = "",
				"config" = "",
				"path" = ""
			}

	};

	structappend($EasyRoutes, $EasyCustomRoutes, true);

	$EasyServices =
	{
		"NavigationObject" = {
			object="com.easyxms.services.navigation",
			init=true,
			initwith=""
		},
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
		},
		"PLUGINS" = {
			object= "com.easyxms.services.pluginsloader",
			init = true,
			initwith = "init",
			objects = {
				"pluginsfolder" = "/obj/plugins"
			}
		},
		/* Must be last Object*/
		"Installer" = {
			object="com.easyxms.services.installer",
			init=true,
			initwith="init"
		}
	};
}