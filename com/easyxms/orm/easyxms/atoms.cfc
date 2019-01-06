/**
 * atoms
 *
 * @author Oliver
 * @date 22.04.16
 **/

component accessors=true output=false persistent="true" entityname="ATOMS" table="ATOMS" datasource="easyxms" {

	property name="ATOM_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="ATOM_TITLE" length="255" type="string" required="true";
	property name="ATOM_SHORT" length="255" type="string";
	property name="ATOM_TEXT" ormtype="text" sql_type="CF_SQL_LONGVARCHAR" type="string";
	property name="ATOM_TYPE_KEY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="ATOM_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="ATOM_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="ATOM_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER";
	property name="ATOM_CREATED" type="date";
	property name="ATOM_CHANGED" type="date";
	property name="ATOM_DELETED" type="date";

}