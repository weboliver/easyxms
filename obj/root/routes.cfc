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
				"config" = "obj.root.configuration.homepage.config",
				"path" = "/index.cfm"
			},
		"/news/index.cfm" =	{
				"name" = "News",
				"config" = "obj.root.configuration.news.config",
				"path" = "/news/index.cfm"
			},
		"/admin/" =	{
				"contains" = "/admin/",
				"name" = "Administration",
				"config" = "obj.root.configuration.admin.config",
				"path" = ""
			},
		"/_tests/" =	{
				"contains" = "/_tests/",
				"name" = "Test",
				"config" = "_tests.obj.root.configuration.config",
				"path" = ""
			},
		"*" =	{
				"component" = "obj.services.urls",
				"name" = "",
				"config" = "",
				"path" = ""
			}

	};

	structappend($EasyRoutes, $EasyCustomRoutes, true);

	$EasyServices =
	{
		"NavigationObject" = {
			object="obj.services.navigation",
			init=true,
			initwith=""
		},
		"GlobalConst" = {
			object="obj.services.const",
			init=true,
			initwith="init"
		},
		"DB" = {
			object="obj.services.db",
			init=true,
			initwith="init",
			objects = {
				"easyxms"="MYSQL"
			}
		},
		"PLUGINS" = {
			object= "obj.services.pluginsloader",
			init = true,
			initwith = "init",
			objects = {
				"pluginsfolder" = "/obj/plugins"
			}
		},
		/* Must be last Object*/
		"Installer" = {
			object="obj.services.installer",
			init=true,
			initwith="init"
		}
	};
}