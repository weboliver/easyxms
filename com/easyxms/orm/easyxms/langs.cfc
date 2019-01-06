/**
 * atoms
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent="true" entityname="LANGS" table="LANGS"  datasource="easyxms" {

	property name="LANG_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="LANG_NAME" length="100" type="string" required="true";
	property name="LANG_SHORT" length="10" type="string" required="true";
	property name="LANG_DESC" length="255" type="string";
	property name="LANG_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="LANG_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="LANG_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="LANG_CREATED" type="date";
	property name="LANG_CHANGED" type="date";
	property name="LANG_DELETED" type="date";

}