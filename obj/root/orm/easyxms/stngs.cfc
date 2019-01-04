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
component accessors=true output=false persistent="true" entityname="STNGS" table="STNGS" datasource="easyxms" {

	property name="STNG_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	property name="STNG_NAME" length="100" type="string" required="true";
	property name="STNG_VALUE" length="4000" type="any" required="true";
	property name="STNG_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="STNG_CHANGED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="STNG_DELETED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	property name="STNG_CREATED" type="date";
	property name="STNG_CHANGED" type="date";
	property name="STNG_DELETED" type="date";

}