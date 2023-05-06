*&---------------------------------------------------------------------*
*& Report z013_modular_fizzbuzz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z013_modular_fizzbuzz.

DATA lo_fizzbuzz TYPE REF TO z013_modularisierung_fizzbuzz.



SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE title.

  PARAMETERS: p_userin TYPE int4.

SELECTION-SCREEN END OF BLOCK block1.

INITIALIZATION.
  title = 'Eingabe Maske FIZZBUZZ'.




START-OF-SELECTION.
  lo_fizzbuzz = NEW #( ).
  lo_fizzbuzz->convert( p_userin ).

END-OF-SELECTION.
