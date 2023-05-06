CLASS zlhind_airplane DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zlhind_beschleunigung.
    METHODS: constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zlhind_airplane IMPLEMENTATION.



  METHOD zlhind_beschleunigung~beschleunigen.

    km_h = zlhind_beschleunigung~gv_gesch + iv_besch.

  ENDMETHOD.

**********************************************************************
  METHOD zlhind_beschleunigung~bremsen.

    km_h = zlhind_beschleunigung~gv_gesch - iv_brem.

  ENDMETHOD.

**********************************************************************
  METHOD constructor.

    zlhind_beschleunigung~gv_gesch = 400.

  ENDMETHOD.

**********************************************************************

ENDCLASS.
