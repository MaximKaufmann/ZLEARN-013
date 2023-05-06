*&---------------------------------------------------------------------*
*& Include zlearn_include_013b_f01
*&---------------------------------------------------------------------*


FORM fib
    USING a TYPE i
    CHANGING o TYPE i.
  IF a <= 0.
     o = 1.
  ELSE.
     DATA: lv_a1 TYPE i,
           lv_a2 TYPE i,
           lv_o1 TYPE i,
           lv_o2 TYPE i.
       lv_a1 = a - 1.
       PERFORM fib USING lv_a1 CHANGING lv_o1.
       lv_a2 = a - 2.
       PERFORM fib USING lv_a2 CHANGING lv_o2.
       o = lv_o1 + lv_o2.
  ENDIF.
ENDFORM.
