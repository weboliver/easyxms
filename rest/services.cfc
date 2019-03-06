<cfcomponent rest="true" restpath="services">
	<cffunction name="test" access="remote" returntype="struct" httpmethod="post" restpath="test">
		<cfargument name="myname" type="string" required="false"/>

		<cfreturn arguments>
	</cffunction>
</cfcomponent>