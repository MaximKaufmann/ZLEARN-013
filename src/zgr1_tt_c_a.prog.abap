*&---------------------------------------------------------------------*
*& Report zgr1_tt_c_a
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgr1_tt_c_a.
CLASS ltcl_ DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      unit_test_sorted_table    FOR TESTING,
      test_with_hashtable       FOR TESTING.
ENDCLASS.


CLASS ltcl_ IMPLEMENTATION.

  METHOD unit_test_sorted_table.

*    TYPES tt_fizzbuzz TYPE SORTED TABLE OF zgr1aj_db_fizzb WITH DEFAULT KEY.
*    TYPES tt_fizzbuzz TYPE SORTED TABLE OF zgr1aj_db_fizzb WITH UNIQUE KEY input_number.


*    DATA lt_fizzbuzz TYPE SORTED TABLE OF zgr1aj_db_fizzb WITH UNIQUE KEY input_number.
*    DATA ls_fizzbuzz TYPE zgr1aj_db_fizzb.

    TYPES tt_fizzbuzz TYPE STANDARD TABLE OF zgr1aj_db_fizzb WITH DEFAULT KEY.


    DATA lt_fizzbuzz TYPE tt_fizzbuzz.
    DATA ls_fizzbuzz TYPE zgr1aj_db_fizzb.


    APPEND VALUE zgr1aj_db_fizzb( input_number = 1 ergebnis = '1' ) TO lt_fizzbuzz.


    ls_fizzbuzz-input_number = 2.
    ls_fizzbuzz-ergebnis = '2'.
    APPEND ls_fizzbuzz TO lt_fizzbuzz.

    APPEND VALUE zgr1aj_db_fizzb( input_number = 3 ergebnis = 'FIZZ' ) TO lt_fizzbuzz.

*    APPEND INITIAL LINE TO lt_fizzbuzz ASSIGNING FIELD-SYMBOL(<fs_fizzbuzz>).
*    <fs_fizzbuzz>-input_number = 3.
*    <fs_fizzbuzz>-ergebnis = 'FIZZ'.
*
*
*    ls_fizzbuzz-input_number = 2.
*    ls_fizzbuzz-ergebnis = '2'.
*
*    INSERT ls_fizzbuzz INTO lt_fizzbuzz INDEX 3.



    cl_abap_unit_assert=>assert_equals( msg = 'msg'
                                        exp = VALUE tt_fizzbuzz( ( input_number = 1 ergebnis = '1' )
                                                                 ( input_number = 2 ergebnis = '2' )
                                                                 ( input_number = 3 ergebnis = 'FIZZ' ) )
                                        act = lt_fizzbuzz ).

  ENDMETHOD.



  METHOD test_with_hashtable.

*    TYPES tt_fizzbuzz TYPE HASHED TABLE OF zgr1aj_db_fizzb WITH UNIQUE KEY input_number.
*
*    DATA tt_fizzbuzz TYPE zgr1aj_db_fizzb.
*    DATA lt_fizzbuzz TYPE zgr2_tt_013.
**    DATA ls_fizzbuzz TYPE zgr1aj_db_fizzb.
*
*
*    INSERT VALUE zgr1aj_db_fizzb( input_number = 1 ergebnis = '1' ) INTO TABLE lt_fizzbuzz.
*    INSERT VALUE zgr1aj_db_fizzb( input_number = 2 ergebnis = '2' ) INTO TABLE lt_fizzbuzz.
*    INSERT VALUE zgr1aj_db_fizzb( input_number = 3 ergebnis = 'FIZZ' ) INTO TABLE lt_fizzbuzz.
*
*
*
*
*    cl_abap_unit_assert=>assert_equals( msg = 'msg'
*                                        exp = VALUE tt_fizzbuzz( ( input_number = 1 ergebnis = '1' )
*                                                                     ( input_number = 2 ergebnis = '2' )
*                                                                     ( input_number = 3 ergebnis = 'FIZZ' ) )
*                                        act = lt_fizzbuzz ).
  ENDMETHOD.

ENDCLASS.
