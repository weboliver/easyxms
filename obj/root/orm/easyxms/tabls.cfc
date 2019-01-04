/**
 * tabls
 *
 * @author Oliver
 * @date 09.07.16
 **/
component accessors=true output=false persistent="true" entityname="TABLS" table="TABLS" datasource="easyxms" {

	property name="TABL_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="TABL_NAME" length="100" type="string" required="true";
	property name="TABL_DESC" length="255" type="string";
	property name="TABL_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="TABL_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="TABL_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="TABL_CREATED" type="date";
	property name="TABL_CHANGED" type="date";
	property name="TABL_DELETED" type="date";

}