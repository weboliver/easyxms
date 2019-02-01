Entity
<cfdump var="#getBaseVariables()#">
<cfabort>
<cfset strctServices = $EasyXMS.getservices()>
<cfdump var="#strctServices#">
<cfabort>
<cfset oDB = $EasyXMS.getservice("DB")>
<cfset result = oDB.addAtom('test',0, '','',1)>
updateElementbyExample
<cfdump var="#result#">