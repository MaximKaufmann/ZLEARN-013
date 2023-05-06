*&---------------------------------------------------------------------*
*& Report zunit_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zunit_test.

CLASS ltcl_unit_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      kontrollstrukturen_test FOR TESTING,
      test_if_else            FOR TESTING.
ENDCLASS.


CLASS ltcl_unit_test IMPLEMENTATION.

  METHOD kontrollstrukturen_test.
    DATA lv_result TYPE int1.

    lv_result = 1.

    cl_abap_unit_assert=>assert_equals( msg = 'Für IF soll Ergebniss 1 zurück kommen'
                                        exp = '1'
                                        act = lv_result ).
  ENDMETHOD.

  METHOD test_if_else.
    DATA lv_result TYPE string.
    DATA lv_input  TYPE int1.

    lv_input = 3.

    IF lv_input = 3.
      lv_result = 'Buzz'.
    ENDIF.

    cl_abap_unit_assert=>assert_equals( msg = 'Falls Input = 3, dann Result = Buzz'
                                        exp = 'Buzz'
                                        act = lv_result ).
  ENDMETHOD.

ENDCLASS.
