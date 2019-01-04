<cfsilent>
	<cfset $EasyCharset = getVar("$EasyCharset", "utf-8")>
	<cfset $EasyMetaKeywords = getVar("$EasyMetaKeywords", "")>
	<cfset $EasyMetaDescription = getVar("$EasyMetaDescription", "")>
	<cfset $EasyViewport = getVar("$EasyViewport", "width=device-width, initial-scale=1.0")>
</cfsilent>
<cfoutput>
	<!-- Meta Information -->
	<meta charset="#$EasyCharset#">
	<meta name="keywords" content="#$EasyMetaKeywords#">
	<meta name="description" content="#$EasyMetaDescription#">
	<meta name="viewport" content="#$EasyViewport#">
</cfoutput>