/**
 * atoms
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent="true" entityname="CNTNT" table="CNTNT" datasource="easyxms"  {

	property name="CNTN_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="CNTN_TITLE_1" length="255" type="string" required="true";
	property name="CNTN_TITLE_2" length="255" type="string";
	property name="CNTN_ABSTRACT" length="4000" type="string";
	property name="CNTN_TEXT" type="text";
	property name="CNTN_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="CNTN_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="CNTN_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="CNTN_CREATED" type="date";
	property name="CNTN_CHANGED" type="date";
	property name="CNTN_DELETED" type="date";

}