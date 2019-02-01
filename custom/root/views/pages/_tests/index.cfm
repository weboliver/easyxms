<@$EasyDocType@>
<html lang="<@$EasyDocLang@>">
<head>
	<@$EasyMetaInformation@>
	<@$EasyStyleSheetHeader@>
	<@$EasyJavascriptHeader@>
	<@$EasyStyleSheetFooter@>
</head>
<body>
	<h2>Test Applikation, bei der man etwas sieht</h2>
	<cfdump var="#getConfigSetup()#">s
	<cfdump var="#$EasyModel.getUrl()#">
	<cfdump var="#$EasyXMS.getservices()#">
	<cfdump var="#getroutes()#">

	<cfdump var="#$EasyXMS.getGlobal('Application_Name')#">
	<cfdump var="#$EasyXMS.getGlobal('Application_Datasource')#">

	<cfset oServices = $EasyXMS.getservices()>

	<cfdump var="#getStandardElements()#">

	<@$EasyJavascriptFooter@>
</body>
</html>