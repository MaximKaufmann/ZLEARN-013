*"* use this source file for your ABAP unit test classes
CLASS ltcl_airbus_a380_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO Z013_airbus_a380.
    METHODS:
      setup,
      airbus_a380_bremsen_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_airbus_a380_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD airbus_a380_bremsen_test.
    cl_abap_unit_assert=>assert_equals( exp = 250
                                        act = mo_cut->zlhind_beschleunigung~bremsen( 75 ) ).
  ENDMETHOD.

ENDCLASS.
