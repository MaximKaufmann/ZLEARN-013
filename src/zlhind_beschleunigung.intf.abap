INTERFACE zlhind_beschleunigung
  PUBLIC .
  DATA gv_gesch TYPE i.

  METHODS:
    bremsen
      IMPORTING iv_brem    TYPE i
      RETURNING VALUE(km_h) TYPE i,
    beschleunigen
      IMPORTING iv_besch    TYPE i
      RETURNING VALUE(km_h) TYPE i.


ENDINTERFACE.
