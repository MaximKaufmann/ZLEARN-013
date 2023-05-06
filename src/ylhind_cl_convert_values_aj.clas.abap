CLASS ylhind_cl_convert_values_aj DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS map_date
      IMPORTING
        iv_date        TYPE char10
      RETURNING
        VALUE(rv_date) TYPE date.
    METHODS map_geschlecht
      IMPORTING
        iv_gesch        TYPE char1
      RETURNING
        VALUE(rv_gesch) TYPE char1.
    METHODS map_sprache_empfaenger
      IMPORTING
        iv_sprache        TYPE spras
      RETURNING
        VALUE(rv_sprache) TYPE spras.
    "! Mapping Wohnsitz Kanton
    "! @parameter iv_post_code        | PLZ der quellensteuerpflichtigen Person
    "! @parameter rv_wohnsitz_kanton  | Wohnsitz Kanton
    METHODS map_wohnsitz_kanton
      IMPORTING
        iv_kanton_id              TYPE char3
        iv_post_code              TYPE numc4
      RETURNING
        VALUE(rv_wohnsitz_kanton) TYPE char3.

  PRIVATE SECTION.

ENDCLASS.

CLASS ylhind_cl_convert_values_aj IMPLEMENTATION.

  METHOD map_wohnsitz_kanton.
    rv_wohnsitz_kanton = COND #( WHEN iv_post_code = '8085' THEN 'EX'
                                 ELSE iv_kanton_id ).
  ENDMETHOD.

  METHOD map_date.
    DATA lv_date TYPE char10.
    lv_date = iv_date.
    REPLACE ALL OCCURRENCES OF '-' IN lv_date WITH ''.

    rv_date = lv_date.


  ENDMETHOD.

  METHOD map_geschlecht.
    IF iv_gesch = 'F'.
      rv_gesch = 1.
    ELSEIF iv_gesch = 'M'.
      rv_gesch = 2.
    ELSE.
      rv_gesch = 3.
    ENDIF.
  ENDMETHOD.

  METHOD map_sprache_empfaenger.

    IF iv_sprache = ''.
      rv_sprache = '1'.
    ELSE.
      rv_sprache = iv_sprache.
    ENDIF.

  ENDMETHOD.

ENDCLASS.


