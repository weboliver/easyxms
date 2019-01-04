/**
 * atoms
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent="true" entityname="CNTXT" table="CNTXT" datasource="easyxms"  {

	property name="CNTX_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="CNTX_NAME" length="100" type="string" required="true";
	property name="CNTX_DESC" length="255" type="string";
	property name="CNTX_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="CNTX_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="CNTX_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="CNTX_CREATED" type="date";
	property name="CNTX_CHANGED" type="date";
	property name="CNTX_DELETED" type="date";

}