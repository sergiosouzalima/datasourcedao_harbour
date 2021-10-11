/*
    System.......: daodatasource
    Program......: daodatasourcedatasource_class.prg
    Description..: Belongs to Model daodatasource to allow access to a datasource.
    Author.......: Sergio Lima
    Updated at...: Oct, 2021

	How to compile:
	hbmk2 daodatasource_test.hbp

	How to run:
	./daodatasource_test

*/

#include "hbclass.ch"
#require "hbsqlit3"

#include "../../hbexpect/lib/hbexpect.ch"


FUNCTION Main()

	begin tests
		LOCAL oDataSource := NIL, pConnection := NIL
		 
		hb_vfErase("datasource.s3db")

		describe "DaoDatasource Class"
			oDataSource := daoDatasource():New("datasource.s3db")
			pConnection := oDataSource:getConnection()

			context "when instantiate" expect (oDataSource) TO_BE_CLASS_NAME("DaoDatasource")

			describe "When getting connection"	
				context "receives a pointer" expect(pConnection) TO_BE_POINTER
				context "receives not nil" expect(pConnection) NOT_TO_BE_NIL
			enddescribe

			describe "When closing a connection"
				context "receives NIL" expect(oDataSource:closeConnection()) TO_BE_NIL
			enddescribe

		enddescribe
	endtests

RETURN NIL
