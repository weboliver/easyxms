# easyxms
Repository will be using two main branches.

- develop
- master

Versioning will follow later

It will use following technologies:

- bootstrap
- Angular and later React
- Lucee Server
- IIS 7.5 and above Webserver
- A SQL Database (Oracle, MySQL, MSSQL) with ORM or Mongo DB

The Datasource is called: easyxms. 
Directory _pre contains recent sql Table Scripts (obsolete) ORM will create tables on MySQL.

Tested unter Lucee 5.2XX

I added only the necessary parts of MXUnit for testing purposes.

# Install

Create a mapping to the EasyXMS Project Name if you want to use MXUnit Tests (most likely easyxms).
Set ORM in Lucee Administrator to "update" and Lucee will create the necessary tables and fields. 
Set this.install=true in Application.cfc
Create a rest mapping /easy to {web-root}/com/easyxms/rest
Under Language Compiler set Null Support to Full support

# MXUnit

The complete MXUnit is here: https://github.com/mxunit/mxunit

#PLAN so far

1. Create a headless REST API
   - a
   - b
   - c
2. Create a angular 7 based Administration
3. Create a react based Administration

