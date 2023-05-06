FUNCTION Zfib.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_INDEX) TYPE  I
*"  EXPORTING
*"     REFERENCE(EV_FIBO_NUMBER) TYPE  I
*"----------------------------------------------------------------------
  IF iv_index < 0. "exception handling
    RAISE index_lower_than_zero.
  ELSE. "calculate the result
    DATA(index_substracted1) = iv_index - 1.
    DATA(index_substracted2) = iv_index - 2.

    IF iv_index LE 2.
      ev_fibo_number = 1.
    ELSE.
      DATA(result1) = 0.
      CALL FUNCTION 'ZFIB'
        EXPORTING
          iv_index       = index_substracted1
        IMPORTING
          ev_fibo_number = result1.

      DATA(result2) = 0.
      CALL FUNCTION 'ZFIB'
        EXPORTING
          iv_index       = index_substracted2
        IMPORTING
          ev_fibo_number = result2.

      ev_fibo_number = result1 + result2. "return
    ENDIF.
  ENDIF.

ENDFUNCTION.
