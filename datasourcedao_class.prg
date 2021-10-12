/*
    System.......: DAO
    Program......: datasourcedao_class.prg
    Description..: Belongs to Model DAO to allow access to a datasource.
    Author.......: Sergio Lima
    Updated at...: Oct, 2021
l*/


#include "hbclass.ch"
#require "hbsqlit3"

CREATE CLASS DatasourceDao 
    EXPORTED:
        METHOD New(cConnection) CONSTRUCTOR
        METHOD getConnection() 
        METHOD Destroy()
        METHOD closeConnection()

    PROTECTED:
        DATA pConnection    AS POINTER  INIT NIL
    HIDDEN:
        DATA cConnection    AS STRING   INIT ""
        DATA lCreateDB      AS LOGICAL  INIT .T. // Create database if it doesn't exist

ENDCLASS

METHOD New(cConnection) CLASS DatasourceDao
    ::cConnection := hb_defaultValue(cConnection, "datasource.s3db")
    ::pConnection := sqlite3_open(::cConnection, .T.)
RETURN Self

METHOD Destroy() CLASS DatasourceDao
    Self := NIL
RETURN Self

METHOD getConnection() CLASS DatasourceDao
RETURN ::pConnection

METHOD closeConnection() CLASS DatasourceDao
RETURN ::Destroy()

