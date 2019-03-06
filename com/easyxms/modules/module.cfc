/**
 * module
 *
 * @author Oliver
 * @date 04.02.19
 **/
<cfcomponent accessors=true output=false persistent=false extends="com.easyxms.application.base">

	<cfscript>
	<!--- Global Variables in Template Handler Component --->
	$EasyXMS = Application.EasyXMS;
	$EasyJavascriptHeader = "";
	$EasyJavascriptFooter = "";
	$EasyMetaInformation = "";
	$EasyStyleSheetHeader = "";
	$EasyStyleSheetFooter = "";
	$EasyDocType = "";
	$EasyParts = {Home = "Homepage"};
	$EasyTemplate = [];
	$EasyCharset = "utf-8";
	$EasyComponents = $EasyXMS.getComponents();
	$EasyServices = $EasyXMS.getServices();
	$EasyConfig= NullValue();
	$EasyModel = NullValue();
	$EasyController = NullValue();

	function setConfig(any oConfig) {
		$EasyConfig = oConfig;
	}

	function getConfig() {
		return $EasyConfig;
	}

	function setModel(any oModel) {
		$EasyModel = oModel;
	}

	function getModel() {
		return $EasyModel;
	}

	function setController(any oController) {
		$EasyController = oController;
	}

	function getController() {
		return $EasyController;
	}

	</cfscript>

	<!--- Returns All Standard GlobalVariables --->
	<cffunction name="getStandardElements">
		<cfset var strctStandardElements = {}>
		<cfloop collection="#variables#" item="name">
			<cfif left(name, 1) is "$">
				<cfset strctStandardElements[name] = variables[name]>
			</cfif>
		</cfloop>
		<cfreturn strctStandardElements>
	</cffunction>

	<cffunction name="getTemplatePlaceHolder" returntype="string">
		<cfreturn $EasyConfig.getTemplatePlaceHolder()>
	</cffunction>

	<cffunction name="getViewPlaceHolder" returntype="string">
		<cfreturn $EasyConfig.getViewPlaceHolder()>
	</cffunction>

	<cffunction name="includetemplate" returntype="string">
		<cfargument name="template" type="string">
		<cfset var sResult = "">
		<cfset template = replace(template, $EasyConfig.getviewPlaceHolder(), $EasyConfig.getSetting("views"))>
		<cfset $EasyModel = getModel()>
		<cfsavecontent variable="sResult"><cfinclude template="#template#"></cfsavecontent>
		<cfif find("<@", sResult)>
			<cfset getPlaceHolders()>
		</cfif>
		<cfreturn eval(sResult)>
	</cffunction>

	<!--- Function returns Standard Elements. You can query the Standard Elements by invoking the function getStandardElements --->
	<cffunction name="getPlaceHolders" access="public">
		<cfset var sResult = "">
		<cfset var template = "">
		<cfset $EasyDocType = $EasyConfig.getdoctype()>
		<cfset $EasyCharset = $EasyConfig.getcharset()>
		<cfset var artemplates = $EasyConfig.getJavascript().head>
		<cfloop array="#artemplates#" index="template">
			<cfsavecontent variable="$EasyJavascriptHeader"><cfoutput>#$EasyJavascriptHeader#</cfoutput><cfinclude template="#replace(template, getTemplatePlaceHolder(), $EasyConfig.getSetting("templates"))#"></cfsavecontent>
		</cfloop>
		<cfset artemplates = $EasyConfig.getJavascript().foot>
		<cfloop array="#artemplates#" index="template">
			<cfsavecontent variable="$EasyJavascriptFooter"><cfoutput>#$EasyJavascriptFooter#</cfoutput><cfinclude template="#replace(template, getTemplatePlaceHolder(), $EasyConfig.getSetting("templates"))#"></cfsavecontent>
		</cfloop>
		<cfset template = $EasyConfig.getMetaInformation()>
		<cfsavecontent variable="$EasyMetaInformation"><cfinclude template="#replace(template, getTemplatePlaceHolder(), $EasyConfig.getSetting("templates"))#"></cfsavecontent>

		<cfset artemplates = $EasyConfig.getStyleSheets().head>
		<cfloop array="#artemplates#" index="template">
			<cfsavecontent variable="$EasyStyleSheetHeader"><cfoutput>#$EasyStyleSheetHeader#</cfoutput><cfinclude template="#replace(template, getTemplatePlaceHolder(), $EasyConfig.getSetting("templates"))#"></cfsavecontent>
		</cfloop>

		<cfset artemplates = $EasyConfig.getStyleSheets().foot>
		<cfloop array="#artemplates#" index="template">
			<cfsavecontent variable="$EasyStyleSheetFooter"><cfoutput>#$EasyStyleSheetFooter#</cfoutput><cfinclude template="#replace(template, getTemplatePlaceHolder(), $EasyConfig.getSetting("templates"))#"></cfsavecontent>
		</cfloop>

		<cfset $EasyDocLang =  $EasyConfig.getLang()>
	</cffunction>

	<cffunction name="GetParts" returntype="struct">
		<cfreturn $EasyParts>
	</cffunction>

</cfcomponent>