/**
 * const
 *
 * @author Oliver
 * @date 08.04.16
 * 
 * This Component loads Plugins from a Plugin Folder into EasyXMS
 **/
component accessors=true output=false persistent=false {

	public function init() {

		setPluginsFolder(arguments.objects["pluginsfolder"]);
		_strctAllPlugins = {};

		var qAllComponents = DirectoryList(getPluginsFolder(), true, "query", "*.cfc");
		for (var rec in qAllComponents) {
			var sPluginName = listfirst(rec.name, ".");
			var sPluginComponent = replace(rec.directory, Expandpath("/"), "");

			var bSingleton = false;
			if (find("singleton", sPluginComponent)) {
				bSingleton = true;
			}

			sPluginComponent = replacelist(sPluginComponent, "\\,/", ".", "all") & "." & sPluginName;
			setPlugin(sPluginName, sPluginComponent, bSingleton);
		}
		return this;
	}

	private function setPlugin(string PluginName, string PluginComponent, boolean bSingleton) {

		if (bSingleton) {
			_strctAllPlugins[PluginName] = createobject(PluginComponent);
			var oPlugin = _strctAllPlugins[PluginName];
			var bHasInit = ArrayLen(structFindValue(getMetaData(oPlugin), "init"));
			if (bHasInit)
				_strctAllPlugins[PluginName] = oPlugin.init();
		}
		else
			_strctAllPlugins[PluginName] = PluginComponent;


    }

    public any function getPlugin(string PluginName) {

		if (structKeyExists(_strctAllPlugins, PluginName))
		{
			if (IsSimpleValue(_strctAllPlugins[PluginName])) {

				var sPlugin = _strctAllPlugins[PluginName];
				var oPlugin = createobject(_strctAllPlugins[PluginName]);
				var bHasInit = ArrayLen(structFindValue(getMetaData(oPlugin), "init"));
				if (bHasInit)
					return oPlugin.init();
				else
					return oPlugin;
			}
			else
				return _strctAllPlugins[PluginName];

		}
		else
		{
			var sException = "Plugin not found: " & PluginName;
			throw sException;
		}
    }

    public struct function getPlugins() {
    	return _strctAllPlugins;
    }

    public struct function getServices() {

    	return _EasyServices;
    }


	function setPluginsFolder(string pluginsfolder) {

		_pluginsfolder = arguments.pluginsfolder;
	}

	string function getPluginsFolder() {

		return _pluginsfolder;
	}

}