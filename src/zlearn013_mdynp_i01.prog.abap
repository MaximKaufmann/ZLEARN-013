*&---------------------------------------------------------------------*
*& Include          ZLEARN013_MDYNP_I01
*&---------------------------------------------------------------------*

MODULE user_command_0100 INPUT.
  IF sy-ucomm = 'BACK'.
    LEAVE PROGRAM.
  ENDIF.

  IF sy-ucomm = 'ADD'.
*    cl_abap_browser=>show_url( url          = 'https://www.sandbox.paypal.com/invoice/s/pay/INV2-7CC6-E8RE-UXM8-CVZB'
*                           title        = 'ABAP-Browser'
*                           size         = cl_abap_browser=>large
*                           modal        = abap_true
*                           printing     = abap_false
*                           buttons      = abap_true
*                           format       = cl_abap_browser=>landscape
*                           position     = cl_abap_browser=>topleft
*                           context_menu = abap_false ).
    CALL FUNCTION 'CALL_BROWSER'
      EXPORTING
        url                    = 'https://www.sandbox.paypal.com/invoice/s/pay/INV2-7CC6-E8RE-UXM8-CVZB'
      EXCEPTIONS
        frontend_not_supported = 1
        frontend_error         = 2
        prog_not_found         = 3
        no_batch               = 4
        unspecified_error      = 5
        OTHERS                 = 6.
    CALL SCREEN 200.
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  IF sy-ucomm = 'ABBR'.
    CALL SCREEN 100.
  ENDIF.

  IF sy-ucomm = 'SAVE'.

*    IF sy-subrc <> 0.
*      CALL FUNCTION 'POPUP_TO_CONFIRM'.
*    ELSE.
*
*    ENDIF.

    INSERT zlearn013_mdynp.
*    cl_gui_cfw=>flush(  ).
    lo_alv->refresh( ).
    CALL SCREEN 100.
  ENDIF.
ENDMODULE.
