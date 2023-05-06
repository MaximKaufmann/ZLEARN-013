*&---------------------------------------------------------------------*
*& Include z013_inc_fizzbuzz
*&---------------------------------------------------------------------*

CLASS lcl_fizzbuzz DEFINITION.

  PUBLIC SECTION.
    METHODS userinput
      IMPORTING
                iv_num      TYPE int4
      RETURNING VALUE(itab) TYPE z013_tt_fizzb."TT = Table Type Of this Struct z013_st_fizzb"


  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.


CLASS lcl_fizzbuzz IMPLEMENTATION.

  METHOD userinput.

    DATA: lv_zaehler TYPE i.

    DATA ls_result TYPE z013_st_fizzb.

    lv_zaehler = 1.

    WHILE lv_zaehler <= iv_num.

      IF lv_zaehler MOD 3 = 0 AND lv_zaehler MOD 5 = 0.
*        WRITE / 'FizzBuzz'.
        ls_result-z_output = 'FizzBuzz'.
      ELSEIF
          lv_zaehler MOD 5 = 0.
*        WRITE / 'Buzz'.
        ls_result-z_output = 'Buzz'.
      ELSEIF
      lv_zaehler MOD 3 = 0.
*        WRITE / 'Fizz'.
        ls_result-z_output = 'Fizz'.
      ELSE.
*        WRITE / lv_zaehler.
        ls_result-z_output = lv_zaehler.
      ENDIF.

      ls_result-z_input = lv_zaehler.
      lv_zaehler = lv_zaehler + 1.

      APPEND ls_result TO itab.

    ENDWHILE.


  ENDMETHOD.

ENDCLASS.
