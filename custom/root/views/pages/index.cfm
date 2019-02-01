<@$EasyDocType@>
<html lang="<@$EasyDocLang@>">
<head>
	<@$EasyMetaInformation@>
	<@$EasyStyleSheetHeader@>
	<@$EasyJavascriptHeader@>
	<@$EasyStyleSheetFooter@>
</head>
<body>
	<cfset setLocale("de_DE")>
	<cfset dt = "2016-04-03">
	<cfset lsParseDatetime(dt)>
	<h2>Zugriff auf REST Service: <cfoutput>http://#cgi.server_name#:#cgi.SERVER_PORT#/rest/easy/xms/getStandardEvents</cfoutput></h2>
	<cfhttp url="http://#cgi.server_name#:#cgi.SERVER_PORT#/rest/easy/xms/getStandardEvents"
        method="get"
        result="resultJSON" >
	    <cfhttpparam type="header"
	                 name="Accept"
	                 value="application/json">
	</cfhttp>

	<cfdump var="#resultJSON#">

	<!---
	<cfscript>
		var my ="";
		if (true) {

			;

		}
	</cfscript>

	<cfdump var="#getConfigSetup()#">
	<cfdump var="#resultJSON.Filecontent#">
	<cfdump var="#$EasyModel.getUrl()#">
	<cfdump var="#$EasyXMS.getservices()#">
	<cfdump var="#getroutes()#">

	<cfdump var="#$EasyXMS.getGlobal('Application_Name')#">
	<cfdump var="#$EasyXMS.getGlobal('Application_Datasource')#">

	<cfset oServices = $EasyXMS.getservices()>

	<cfdump var="#getStandardElements()#">
	--->
	<@$EasyJavascriptFooter@>
</body>
</html>