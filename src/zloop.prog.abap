*&---------------------------------------------------------------------*
*& Report ZLOOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zloop.

*struktur angelegt
*TYPES: BEGIN OF lty_s_mitarbeiter,
*         pnr   TYPE i,
*         vname TYPE string,
*         name  TYPE  string,
*         alter TYPE i,
*       END OF lty_s_mitarbeiter.
*
*
*DATA: gs_mitarbeiter TYPE lty_s_mitarbeiter,
*      gt_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter.
*
*gs_mitarbeiter-pnr = 1.
*gs_mitarbeiter-vname = 'Hans'.
*gs_mitarbeiter-name = 'Peter'.
*gs_mitarbeiter-alter = 30.
*APPEND gs_mitarbeiter TO gt_mitarbeiter.
*
*gs_mitarbeiter-pnr = 2.
*gs_mitarbeiter-vname = 'Sara'.
*gs_mitarbeiter-name = 'Ahmed'.
*gs_mitarbeiter-alter = 29.
*APPEND gs_mitarbeiter TO gt_mitarbeiter.
*
*LOOP AT gt_mitarbeiter INTO gs_mitarbeiter.
*
*
*
*  WRITE: / gs_mitarbeiter-pnr,
*           gs_mitarbeiter-vname,
*           gs_mitarbeiter-name,
*           gs_mitarbeiter-alter.
*
*ENDLOOP.




PARAMETERS: param1(10) TYPE n,
            param2(10) TYPE n.


DATA: result TYPE int1.

result = param1 * param2.

DO result TIMES.
  result = result - 1.

  IF result MOD 2 = 0.

  ELSE.
    WRITE: / result.
  ENDIF.

ENDDO.

*WHILE result <= result.
*
*  result = result - 1.
*
*  IF result MOD 2 = 0.
*
*  ELSE.
*    WRITE: / result.
*  ENDIF.
*
*ENDWHILE.
