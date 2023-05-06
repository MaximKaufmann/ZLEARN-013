*&---------------------------------------------------------------------*
*& Report z013_unit_test_tabeltype
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z013_unit_test_tabeltype.

CLASS lit_unit_test_table_types_ DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test_with_std_table_type  FOR TESTING,
      test_loka_global FOR testing.
ENDCLASS.


CLASS lit_unit_test_table_types_ IMPLEMENTATION.

  METHOD test_with_std_table_type.

    TYPES tt_fizzbuzz TYPE STANDARD TABLE OF zgr1aj_db_fizzb WITH DEFAULT KEY.


    DATA lt_fizzbuzz TYPE tt_fizzbuzz.
    DATA ls_fizzbuzz TYPE zgr1aj_db_fizzb.

    APPEND VALUE zgr1aj_db_fizzb( input_number = 1 ergebnis = '1' ) TO lt_fizzbuzz.

    ls_fizzbuzz-input_number = 2.
    ls_fizzbuzz-ergebnis = '2'.
    APPEND ls_fizzbuzz TO lt_fizzbuzz.

    APPEND INITIAL LINE TO lt_fizzbuzz ASSIGNING FIELD-SYMBOL(<fs_fizzbuzz>).
    <fs_fizzbuzz>-input_number = 3.
    <fs_fizzbuzz>-ergebnis = 'FIZZ'.

*    APPEND VALUE zgr1aj_db_fizzb( input_number = 2 ergebnis = '2' ) TO lt_fizzbuzz.
*    APPEND VALUE zgr1aj_db_fizzb( input_number = 3 ergebnis = 'FIZZ' ) TO lt_fizzbuzz.

    cl_abap_unit_assert=>assert_equals( msg = 'msg'
                                    exp = VALUE tt_fizzbuzz(    ( input_number = 1 ergebnis = '1' )
                                                                ( input_number = 2 ergebnis = '2' )
                                                                ( input_number = 3 ergebnis = 'FIZZ' ) )
                                        act = lt_fizzbuzz ).

  ENDMETHOD.

  METHOD test_loka_global.
*    lt_fizzbuzz = 2.
  ENDMETHOD.

ENDCLASS.
