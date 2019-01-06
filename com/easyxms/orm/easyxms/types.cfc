/**
 * types
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent="true" entityname="TYPES" table="TYPES" datasource="easyxms"  {

	property name="TYPE_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id";
	property name="TYPE_KEY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="TYPE_NAME" length="100" type="string" required="true";
	property name="TYPE_SHORTCUT" length="40" type="string" required="true";
	property name="TYPE_DESCRIPTION" length="255" type="string";
	property name="TYPE_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="TYPE_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="TYPE_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="TYPE_CREATED" type="date";
	property name="TYPE_CHANGED" type="date";
	property name="TYPE_DELETED" type="date";

}