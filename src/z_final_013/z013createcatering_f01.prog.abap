*&---------------------------------------------------------------------*
*& Include z013createcatering_f01
*&---------------------------------------------------------------------*

FORM sendapi USING parameter_ean TYPE string
                        lv_eventname TYPE string
                        lv_eventdate TYPE string.
*MESSAGE 'Anfrage war erfolgreich.' TYPE 'I'.


  TRY.
* URL
      DATA(lv_url) = |https://world.openfoodfacts.org/api/v0/product/{ parameter_ean }/|.
      DATA lv_ean TYPE string.
      lv_ean = lv_url.
      REPLACE 'https://world.openfoodfacts.org/api/v0/product/' IN lv_ean WITH ''.
      REPLACE '/' IN lv_ean WITH ''.

      DATA: o_client TYPE REF TO if_http_client.

* Client-Objekt erzeugen
      cl_http_client=>create_by_url( EXPORTING
                                       url     = lv_url
                                     IMPORTING
                                       client  = o_client ).

      IF o_client IS BOUND.
* Anmeldedaten übermitteln
        o_client->authenticate( username = ''
                                password = '' ).

* Logon-Popup ein- bzw. ausschalten
        o_client->propertytype_logon_popup = o_client->co_enabled.

* HTTP-Prtotokoll-Version
        o_client->request->set_version( version = if_http_request=>co_protocol_version_1_1 ).
* HTTP-Method
        o_client->request->set_method( if_http_request=>co_request_method_get ).

* Header-Felder explizit setzen
        o_client->request->set_header_field( name  = '~request_method'
                                             value = 'GET' ).

        o_client->request->set_header_field( name  = 'Content-Type'
                                             value = 'text/xml; charset=utf-8' ).

        o_client->request->set_header_field( name  = 'Accept'
                                             value = 'text/xml, text/html' ).

* Cookies akzeptieren
        o_client->propertytype_accept_cookie = if_http_client=>co_enabled.
* Kompression akzeptieren
        o_client->propertytype_accept_compress = if_http_client=>co_enabled.

* HTTP GET senden, evtl. Timeout angeben
        o_client->send( timeout = if_http_client=>co_timeout_default ).
        DATA: lv_cl_json_parser TYPE REF TO /ui5/cl_json_parser.

* Response lesen
        o_client->receive( ).

        DATA: lv_http_status TYPE i.
        DATA: lv_status_text TYPE string.

* HTTP Return Code holen
        o_client->response->get_status( IMPORTING
                                          code   = lv_http_status
                                          reason = lv_status_text ).

        "      WRITE: / 'HTTP_STATUS_CODE:', lv_http_status.
        "      WRITE: / 'STATUS_TEXT:', lv_status_text.

* Header-Daten der Übertragung
        "      WRITE: / 'HEADER_FIELDS:'.
        DATA(it_header_fields) = VALUE tihttpnvp( ).
        o_client->response->get_header_fields( CHANGING fields = it_header_fields ).

        LOOP AT it_header_fields ASSIGNING FIELD-SYMBOL(<f>).
          "        WRITE: / '[', <f>-name, ']', <f>-value.
        ENDLOOP.

* Cookies holen
        "     WRITE: / 'COOKIES:'.
        DATA(it_cookies) = VALUE tihttpcki( ).
        o_client->response->get_cookies( CHANGING cookies = it_cookies ).

        LOOP AT it_cookies ASSIGNING FIELD-SYMBOL(<c>).
          "        WRITE: / '[', <c>-name, ']', <c>-value, <c>-xdomain, <c>-path, <c>-secure, <c>-expires.
        ENDLOOP.

* vollständige HTTP Nachricht lesen
        DATA(lv_raw_message) = o_client->response->get_raw_message( ).
        DATA: lv_str_msg TYPE string.

* xstring -> string
        DATA(o_conv_r) = cl_abap_conv_in_ce=>create( input    = lv_raw_message
                                                     encoding = 'UTF-8' ).

        o_conv_r->read( IMPORTING data = lv_str_msg ).

        "      WRITE: / 'RAW MESSAGE:', lv_str_msg.

* Wenn Status 200 (Ok)
        IF lv_http_status = 200.
* HTTP Body als Character-Daten
          DATA(lv_result) = o_client->response->get_cdata( ).
          CREATE OBJECT lv_cl_json_parser.
          lv_cl_json_parser->parse( json = LV_result ).

*data ls_co2 TYPE decfloat34.
          DATA(ls_name) = lv_cl_json_parser->value( Path = '/product/product_name' ).
          DATA(ls_code) = lv_cl_json_parser->value( path = '/code' ).
          DATA(ls_co2) = lv_cl_json_parser->value( Path = '/product/ecoscore_data/agribalyse/co2_total' ).



*          cl_abap_container_utilities=>read_container_c( EXPORTING
*                                                           im_container = ls_co2
*                                                         IMPORTING
*                                                           ex_value     = ls_co2 ).

          DATA: ztemp(10),zdd(3),zmmm(3),zyyyy(4),zfinal(12), v_date(10) TYPE c.

          CLEAR: ztemp, zdd, zmmm, zyyyy.

          v_date = lv_eventdate. "yyyy-mm-dd

          zyyyy = v_date+0(4).

          zmmm = v_date+4(2).

          zdd = v_date+6(2).

          CONCATENATE zdd '.' zmmm '.' zyyyy INTO lv_eventdate.


          DATA: wa TYPE zevent_catering.
          wa-event_id = cl_system_uuid=>create_uuid_x16_static( ).
          wa-event = lv_eventname.
          wa-nahrungsmittel = ls_name.
          wa-datum = lv_eventdate.
          wa-co2_total = ls_co2 * 100.


*          INSERT zevent_catering FROM @( wa ).

* sy-dbcnt = Anzahl der eingefügten Zeilen
          MESSAGE |Hinzugefügte Datensätze: { sy-dbcnt }| TYPE 'I'.


          MESSAGE |Nahrungsmittel: { ls_name } / EAN: { ls_code } / CO2 Austoß pro 1g: { ls_co2 }g| TYPE 'I'.
        ENDIF.
* HTTP Connection schließen
        o_client->close( ).
      ENDIF.
    CATCH cx_root INTO DATA(e_txt).
      WRITE: / e_txt->get_text( ).
  ENDTRY.
ENDFORM.
