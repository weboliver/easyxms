<cfcomponent >
	<cffunction name="execquery" returntype="query">
		<cfargument name="sql" required="true">
		<cfargument name="datasource" required="true">
		<cfset var q = 0>
		<cfquery name="q" datasource="#datasource#">
		#preservesingleQuotes(sql)#
		</cfquery>
		<cfreturn q>
	</cffunction>
</cfcomponent>