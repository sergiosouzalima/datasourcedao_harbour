/*
    System.......: datasourcedao
    Program......: datasourcedao_class.prg
    Description..: Belongs to Model datasourcedao to allow access to a datasource.
    Author.......: Sergio Lima
    Updated at...: Oct, 2021

	How to compile:
	hbmk2 datasourcedao_test.hbp

	How to run:
	./datasourcedao_test

*/

#include "hbclass.ch"
#require "hbsqlit3"

#include "../../hbexpect/lib/hbexpect.ch"


FUNCTION Main()

	begin hbexpect
		LOCAL oDataSource := NIL, pConnection := NIL
		 
		hb_vfErase("datasource.s3db")

		describe "DatasourceDao Class"
			oDataSource := DatasourceDao():New() // "datasource.s3db"
			pConnection := oDataSource:getConnection()

			describe "DatasourceDao():New( [cDataBaseName] ) --> oDataSource"
				context "when instantiate" expect (oDataSource) TO_BE_CLASS_NAME("DatasourceDao")

				describe "When getting connection"	
					context "receives a pointer" expect(pConnection) TO_BE_POINTER
					context "receives not nil" expect(pConnection) NOT_TO_BE_NIL
				enddescribe

				describe "When closing a connection"
					context "receives NIL" expect(oDataSource:closeConnection()) TO_BE_NIL
				enddescribe
			enddescribe
		enddescribe
	endhbexpect

RETURN NIL
