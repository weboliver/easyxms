/**
 * users
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent=true entityname="USERS" table="USERS"  datasource="easyxms" {

	property name="USER_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id";
	property name="USER_NAME" length="100" type="string" required="true";
	property name="USER_PASSWORD" length="255" type="string" required="true";
	property name="USER_NAMEFIRST" length="100" type="string";
	property name="USER_NAMELAST" length="100" type="string";
	property name="USER_EMAILADRESS" length="100" type="string";
	property name="USER_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="USER_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="USER_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="USER_CREATED" type="date";
	property name="USER_CHANGED" type="date";
	property name="USER_DELETED" type="date";

}