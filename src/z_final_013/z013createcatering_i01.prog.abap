*&---------------------------------------------------------------------*
*& Include z013createcatering_i01 PAI
*&---------------------------------------------------------------------*

MODULE user_command_0100 INPUT.


  IF sy-ucomm = 'OPEN'.
    DATA: lo_selections TYPE REF TO cl_salv_selections.
    DATA lt_rows TYPE salv_t_row.
    DATA ls_row TYPE i.
    DATA lv_item_ian TYPE int4.

*    DATA lt_descriptions TYPE TABLE OF bseg-sgtxt.
    DATA lv_ean TYPE string.
    DATA lv_ename TYPE string.
    DATA lv_eventdate TYPE string.
    DATA lv_item TYPE string.
    DATA lt_belege TYPE TABLE OF bseg-belnr.
    DATA lv_date TYPE d.

    lo_alv->get_metadata( ).
    lt_rows = lo_alv->get_selections(  )->get_selected_rows(  ).

    LOOP AT lt_rows INTO ls_row.
      READ TABLE lt_event INDEX ls_row INTO DATA(lt_events_selected).
      APPEND lt_events_selected-belnr TO lt_belege.
      LOOP AT lt_eventitems REFERENCE INTO DATA(lr_items).
        IF lr_items->belnr = lt_events_selected-belnr.

          lv_ename = lt_events_selected-ktext.
          lv_eventdate = lr_items->erdat.

          SPLIT lr_items->sgtxt AT ' ' INTO lv_ean lv_item.
          PERFORM sendapi USING lv_ean lv_ename lv_eventdate.
*          APPEND lr_items->sgtxt TO lt_descriptions.
        ENDIF.
      ENDLOOP.
    ENDLOOP.


  ENDIF.

  IF sy-ucomm = 'ABBR'.
    LEAVE PROGRAM.
  ENDIF.
ENDMODULE.
