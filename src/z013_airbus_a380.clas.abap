CLASS z013_airbus_a380 DEFINITION
  PUBLIC
  CREATE PUBLIC
        INHERITING FROM zlhind_airplane.
  PUBLIC SECTION.
  METHODS:
         zlhind_beschleunigung~bremsen REDEFINITION,
         constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z013_airbus_a380 IMPLEMENTATION.

  METHOD zlhind_beschleunigung~bremsen.
    km_h = zlhind_beschleunigung~gv_gesch -  2 * iv_besch.
  ENDMETHOD.

  METHOD constructor.

    super->constructor( ).

  ENDMETHOD.

ENDCLASS.
