CLASS ltcl_convert_values DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO ylhind_cl_convert_values_aj.

    METHODS:
      setup,

      map_wohnsitz_kanton_success FOR TESTING,
      map_date_success FOR TESTING,
      map_geschlecht_success FOR TESTING,
      map_sprache_empfaenger_success FOR TESTING.

ENDCLASS.

CLASS ltcl_convert_values IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD map_wohnsitz_kanton_success.
    " If P_PLZ = 8085 -> EX, else initial
    cl_abap_unit_assert=>assert_equals( exp = 'EX'
                                        act = mo_cut->map_wohnsitz_kanton( iv_post_code = '8085' iv_kanton_id = 'ZH' ) ).
    " Else map Kanton
    cl_abap_unit_assert=>assert_equals( exp = 'ZH'
                                        act = mo_cut->map_wohnsitz_kanton( iv_post_code = '6005' iv_kanton_id = 'ZH' ) ).
  ENDMETHOD.

    METHOD map_date_success.
    " Datum Input YYYY-MM-DD (TYPE CHAR10), Output: YYYYMMDD (Type Datum)
    cl_abap_unit_assert=>assert_equals( exp = '20230223'
                                        act = mo_cut->map_date( iv_date = '2023-02-23' ) ).
  ENDMETHOD.

  METHOD map_geschlecht_success.
    cl_abap_unit_assert=>assert_equals( exp = '1'
                                        act = mo_cut->map_geschlecht( iv_gesch = 'F' ) ).
    cl_abap_unit_assert=>assert_equals( exp = '2'
                                        act = mo_cut->map_geschlecht( iv_gesch = 'M' ) ).
    cl_abap_unit_assert=>assert_equals( exp = '3'
                                        act = mo_cut->map_geschlecht( iv_gesch = 'X' ) ).
  ENDMETHOD.

  METHOD map_sprache_empfaenger_success.
    cl_abap_unit_assert=>assert_equals( exp = '1'
                                        act = mo_cut->map_sprache_empfaenger( iv_sprache = '' ) ).

    cl_abap_unit_assert=>assert_equals( exp = 'D'
                                        act = mo_cut->map_sprache_empfaenger( iv_sprache = 'D') ).
  ENDMETHOD.

ENDCLASS.
