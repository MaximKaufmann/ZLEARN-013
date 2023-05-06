CLASS z013_modularisierung_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS convert IMPORTING iv_num TYPE Int4.

    METHODS userinput
      IMPORTING
                iv_num      TYPE int4
      RETURNING VALUE(itab) TYPE z013_tt_fizzb.


  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS display_r
     CHANGING
        ct_result TYPE z013_tt_fizzb.
ENDCLASS.



CLASS z013_modularisierung_fizzbuzz IMPLEMENTATION.

  METHOD convert.

    DATA(lt_result) = userinput( iv_num ).

    display_r( CHANGING ct_result = lt_result ).

  ENDMETHOD.


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

    DATA lt_ergbnis TYPE z013_tt_fizzb.

  ENDMETHOD.

  METHOD display_r.

*    DATA lt_ergbnis TYPE z013_tt_fizzb.

    TRY.
        DATA lo_salv_table TYPE REF TO cl_salv_table.
        cl_salv_table=>factory(  IMPORTING r_salv_table = lo_salv_table
        CHANGING  t_table          = ct_result ).     " lt_ergebnis ist eure Ergbnistabelle, Struktur kann beliebig sein

        lo_salv_table->display( ).

      CATCH cx_salv_not_found cx_salv_msg. " ALV: General Error Class
    ENDTRY.

  ENDMETHOD.








ENDCLASS.
