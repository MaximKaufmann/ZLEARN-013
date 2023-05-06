*&---------------------------------------------------------------------*
*& Include zlearn_include_013b_i01
*&---------------------------------------------------------------------*

MODULE user_command_0100 INPUT.
  IF sy-ucomm = 'BACK'.
    LEAVE PROGRAM.
  ENDIF.
  IF sy-ucomm = 'OK'.
    DATA:
      m   TYPE string,
      a_s TYPE string.
    a_s = l_dynpro100-alter.
    CONCATENATE 'Hallo' l_dynpro100-vorname l_dynpro100-nachname 'Du bist' a_s ' Jahre alt' INTO m SEPARATED BY ' '.
    MESSAGE m TYPE 'I'.
  ENDIF.
  IF sy-ucomm = 'FIB'.
    DATA: lv_outi TYPE i.
    PERFORM fib USING l_dynpro100-alter CHANGING lv_outi.
    lv_out = lv_outi.
  ENDIF.
ENDMODULE.
