/**
 * attrs
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent="true" entityname="ATTRS" table="ATTRS" datasource="easyxms" {

	property name="ATTR_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="ATTR_SHORT" length="255" type="string" required="true";
	property name="ATTR_INT" type="numeric" sql_type="CF_SQL_INTEGER"  required="true";
	property name="ATTR_DATE" type="date" required="true";
	property name="ATTR_NUM" type="numeric" sql_type="CF_SQL_INTEGER"  required="true";
	property name="ATTR_TEXT" type="text" required="true";
	property name="ATTR_TYPE_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER"  required="true";
	property name="ATTR_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" required="true";
	property name="ATTR_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" required="true";
	property name="ATTR_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" required="true";
	property name="ATTR_CREATED" type="date" required="true";
	property name="ATTR_CHANGED" type="date" required="true";
	property name="ATTR_DELETED" type="date" required="true";



}