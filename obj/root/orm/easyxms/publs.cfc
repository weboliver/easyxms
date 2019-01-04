/**
 * atoms
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent="true" entityname="PUBLS" table="PUBLS" datasource="easyxms"   {

	property name="PUBL_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="PUBL_NAME" length="100" type="string" required="true";
	property name="PUBL_DESC" length="255" type="string";
	property name="PUBL_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="PUBL_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="PUBL_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="PUBL_CREATED" type="date";
	property name="PUBL_CHANGED" type="date";
	property name="PUBL_DELETED" type="date";

}