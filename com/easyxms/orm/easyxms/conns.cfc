/**
 * connections
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent=true entityname="CONNS" table="CONNS"  datasource="easyxms" {

	 property name="CONN_ID" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" fieldtype="id" generator="identity";
	 property name="CONN_FROM" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	 property name="CONN_TO" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	 property name="CONN_TYPE" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	 property name="CONN_SORT" type="string" length="20";
	 property name="CONN_FROM_TYPE" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	 property name="CONN_TO_TYPE" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;
	 property name="CONN_CREATED" type="date";
	 property name="CONN_CREATED_BY" ormtype="int" type="numeric" sql_type="CF_SQL_INTEGER" ;

}