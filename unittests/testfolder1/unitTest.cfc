<cfcomponent extends="mxunit.framework.TestCase">

	<cffunction name="testifRestWorks">
		<cfhttp url="http://#cgi.server_name#:#cgi.SERVER_PORT#/rest/easy/xms/getStandardEvents"
	        method="get"
	        result="resultJSON">
		    <cfhttpparam type="header"
		                 name="Accept"
		                 value="application/json">
		</cfhttp>
		<cfif isJson(resultJSON.Filecontent)>
			<cfset var ar = DeserializeJSON(resultJSON.Filecontent)>
			<cfset assert(Arraylen(ar), 4)>
		<cfelse>
			<cfset fail("Fehler in Rest Schnittstelle")>
		</cfif>
	</cffunction>

</cfcomponent>