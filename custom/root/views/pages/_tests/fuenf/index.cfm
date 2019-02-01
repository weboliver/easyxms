<@$EasyDocType@>
<html lang="<@$EasyDocLang@>">
<head>
	<@$EasyMetaInformation@>
	<@$EasyStyleSheetHeader@>
	<@$EasyJavascriptHeader@>
	<@$EasyStyleSheetFooter@>
</head>
<body>
	<cfset oPlugin = $EasyXMS.getService("PLUGINS")>
	<cfset strctPlugins = oPlugin.getPlugins()>
	<cfset oSamplePlugin = oPlugin.getPlugin("sampleobject")>
	<cfset oSampleSingleton = oPlugin.getPlugin("samplesingleton")>
	<cfset oDB = $EasyXMS.getService("DB")>
	<cfset strct = getMetaData(oSamplePlugin)>

	<cfdump var="#oSamplePlugin#">
	<cfdump var="#oSampleSingleton#">
	<cfset result = structFindValue(strct, "init")>
	<cfdump var="#result#">

	<@$EasyJavascriptFooter@>
</body>
</html>