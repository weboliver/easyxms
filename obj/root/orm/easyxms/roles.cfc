/**
 * users
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent="true" entityname="ROLES" table="ROLES" datasource="easyxms"  {

	property name="ROLE_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id";
	property name="ROLE_NAME" length="100" type="string" required="true";
	property name="ROLE_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="ROLE_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="ROLE_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="ROLE_CREATED" type="date";
	property name="ROLE_CHANGED" type="date";
	property name="ROLE_DELETED" type="date";

}