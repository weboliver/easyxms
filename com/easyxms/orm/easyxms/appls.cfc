/**
 * atoms
 *
 * @author Oliver
 * @date 22.04.16
 **/
/**
 * atoms
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent="true" entityname="APPLS" table="APPLS" datasource="easyxms" {

	property name="APPL_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="APPL_NAME" length="100" type="string" required="true";
	property name="APPL_DESC" length="255" type="string";
	property name="APPL_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="APPL_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="APPL_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="APPL_CREATED" type="date";
	property name="APPL_CHANGED" type="date";
	property name="APPL_DELETED" type="date";

}