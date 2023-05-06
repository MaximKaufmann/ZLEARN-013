*&---------------------------------------------------------------------*
*& Report z013_fizzbuzz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z013_fizzbuzz.

INCLUDE z013_inc_fizzbuzz.


SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE title.

PARAMETERS: p_userin TYPE int4.

SELECTION-SCREEN END OF BLOCK block1.
INITIALIZATION.
title = 'Eingabe Maske FIZZBUZZ'.


DATA lt_ergbnis TYPE z013_tt_fizzb.

START-OF-SELECTION.

  IF p_userin < 16 AND p_userin <> 0.

    DATA(lo_mv) = NEW lcl_fizzbuzz( ).

    lt_ergbnis = lo_mv->userinput(
        iv_num    = p_userin
    ).
    DATA lo_salv_table TYPE REF TO cl_salv_table.

    TRY.
        cl_salv_table=>factory(  IMPORTING r_salv_table = lo_salv_table
        CHANGING  t_table          = lt_ergbnis ).     " lt_ergebnis ist eure Ergbnistabelle, Struktur kann beliebig sein

        lo_salv_table->display( ).

      CATCH cx_salv_not_found cx_salv_msg. " ALV: General Error Class
    ENDTRY.

  ELSE.
    MESSAGE 'Eingabe soll zwischen 1 und 15 sein' TYPE 'I'.
  ENDIF.
