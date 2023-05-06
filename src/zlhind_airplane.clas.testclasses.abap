*"* use this source file for your ABAP unit test classes
CLASS ltcl_beschleunigen_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zlhind_airplane.
    METHODS:
      setup,
      bremsen_test FOR TESTING,
      beschleunigen_test FOR TESTING.
ENDCLASS.


CLASS ltcl_beschleunigen_test IMPLEMENTATION.
  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD bremsen_test.
    cl_abap_unit_assert=>assert_equals( exp = 250
                                        act = mo_cut->zlhind_beschleunigung~bremsen( 150 ) ).
  ENDMETHOD.





  METHOD beschleunigen_test.
    cl_abap_unit_assert=>assert_equals( exp = 550
                                        act = mo_cut->zlhind_beschleunigung~beschleunigen( 150 ) ).
  ENDMETHOD.

ENDCLASS.
