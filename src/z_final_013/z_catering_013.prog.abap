*&---------------------------------------------------------------------*
*& Report z_catering_013
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_catering_013.


INCLUDE z013createcatering_top                     .    " Global Data

TABLES: zevent_catering,
        zevent_rechnungn.

PARAMETERS: p_rechid TYPE aufk-aufnr OBLIGATORY.

DATA: lo_cc TYPE REF TO cl_gui_custom_container.

DATA : lo_alv TYPE REF TO cl_salv_table.

DATA     lv_aufnr TYPE aufk-aufnr.

TYPES: BEGIN OF lty_event,
         belnr TYPE bseg-belnr,
         "buzei TYPE bseg-buzei,
         "sgtxt TYPE bseg-sgtxt,
         ktext TYPE aufk-ktext,
         aufnr TYPE bseg-aufnr,
       END OF lty_event.


TYPES: BEGIN OF lty_eventitems,
         belnr TYPE bseg-belnr,
         buzei TYPE bseg-buzei,
         sgtxt TYPE bseg-sgtxt,
         ktext TYPE aufk-ktext,
         aufnr TYPE bseg-aufnr,
         erdat TYPE aufk-erdat,
       END OF lty_eventitems.



DATA: lt_event TYPE TABLE OF lty_event.
DATA: lt_eventitems TYPE TABLE OF lty_eventitems.
DATA(lv_message) = |Dieser Innenauftrag ist nicht vorhanden { p_rechid }.|.
DATA lv_vorhanden TYPE i.


lv_aufnr = p_rechid.
"zevent_catering-


SELECT
    bseg~belnr AS belegnummer,
     aufk~ktext AS event,
     bseg~aufnr AS auftragsnummer
FROM aufk
INNER JOIN bseg
ON aufk~aufnr = bseg~aufnr
WHERE aufk~aufnr = @p_rechid
GROUP BY bseg~belnr, aufk~ktext, bseg~aufnr
INTO TABLE @lt_event.

SELECT
    bseg~belnr AS belegnummer,
    bseg~buzei AS position,
    bseg~sgtxt AS item,
     aufk~ktext AS event,
     bseg~aufnr AS auftragsnummer,
     aufk~erdat as eventdate
FROM aufk
INNER JOIN bseg
ON aufk~aufnr = bseg~aufnr
WHERE aufk~aufnr = @p_rechid
INTO TABLE @lt_eventitems.



LOOP AT lt_event INTO DATA(ls_event).
  IF  ls_event-aufnr = p_rechid.
    lv_vorhanden = 1.
    EXIT.
  ENDIF.
ENDLOOP.


IF lv_vorhanden IS INITIAL.
  MESSAGE lv_message TYPE 'E'.
ELSE.

ENDIF.

START-OF-SELECTION.

  lo_cc = NEW cl_gui_custom_container( container_name = 'CCONTAINER_SALV' ).

  CALL METHOD cl_salv_table=>factory
    EXPORTING
*     list_display = if_salv_c_bool_sap=>false
      r_container  = lo_cc
    IMPORTING
      r_salv_table = lo_alv
    CHANGING
      t_table      = lt_event.
  .

  lo_alv->get_selections(  )->set_selection_mode( if_salv_c_selection_mode=>multiple ).
  lo_alv->display(  ).
  CALL SCREEN 100.



  INCLUDE z013createcatering_o01                     .  " PBO-Modules
  INCLUDE z013createcatering_i01                     .  " PAI-Modules
  INCLUDE z013createcatering_f01                     .  " FORM-Routines
