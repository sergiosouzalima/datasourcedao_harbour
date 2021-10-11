/*
    System.......: DAO
    Program......: daodatasource_class.prg
    Description..: Belongs to Model DAO to alllow access to a datasource.
    Author.......: Sergio Lima
    Updated at...: Oct, 2021
l*/


#include "hbclass.ch"
#require "hbsqlit3"

CREATE CLASS DaoDatasource 
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

METHOD New(cConnection) CLASS DaoDatasource
    ::cConnection := cConnection
    ::pConnection := sqlite3_open(::cConnection, .T.)
RETURN Self

METHOD Destroy() CLASS DaoDatasource
    Self := NIL
RETURN Self

METHOD getConnection() CLASS DaoDatasource
RETURN ::pConnection

METHOD closeConnection() CLASS DaoDatasource
RETURN ::Destroy()

