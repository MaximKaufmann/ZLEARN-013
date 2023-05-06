*"* use this source file for your ABAP unit test classes
CLASS test DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.

  PRIVATE SECTION.
    DATA:
      f_Cut TYPE REF TO z013_sicf_handler.  "class under test

    METHODS: handle_Request FOR TESTING.
ENDCLASS.       "test


CLASS test IMPLEMENTATION.

  METHOD handle_Request.
    DATA: lv_http_status TYPE i.
    DATA: lv_status_text TYPE string.
    DATA(lv_url) = |https://obd.in4md-service.de/sap/opu/odata/SAP/Z_OB_013_SRV/?$format=json|.

    DATA: o_client TYPE REF TO if_http_client.
    TRY.
* Client-Objekt erzeugen
        cl_http_client=>create_by_url( EXPORTING
                                       url     = lv_url
                                     IMPORTING
                                       client  = o_client ).

        o_client->authenticate( username = 'TEACH-000' password = 'tlestart!').
        o_client->send( timeout = if_http_client=>co_timeout_default ).
* Response lesen
        o_client->receive( ).
* HTTP Return Code holen
        o_client->response->get_status( IMPORTING
                                          code   = lv_http_status
                                          reason = lv_status_text ).

        IF lv_http_status = 200.
* HTTP Body als Character-Daten
          DATA(lv_result) = o_client->response->get_cdata( ).
          cl_abap_unit_assert=>assert_equals( act = lv_result exp = '{"d":{"EntitySets":["BookingsSet"]}}').
        ELSE.
          cl_abap_unit_assert=>fail(  ).
        ENDIF.

* HTTP Connection schließen
        o_client->close( ).

      CATCH cx_root INTO DATA(e_txt).
        WRITE: / e_txt->get_text( ).
        cl_abap_unit_assert=>fail(  ).
    ENDTRY.

  ENDMETHOD.




ENDCLASS.
