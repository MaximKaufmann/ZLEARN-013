*&---------------------------------------------------------------------*
*& Report ZLEARN_INCLUDE_013_B
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE zlearn_include_013b_top                 .    " Global Data

DATA: l_dynpro100 TYPE dynpro100,
      LV_OUT      TYPE string.

INCLUDE zlearn_include_013b_o01                 .  " PBO-Modules
INCLUDE zlearn_include_013b_i01                 .  " PAI-Modules
INCLUDE zlearn_include_013b_f01                 .  " FORM-Routines


START-OF-SELECTION.
  CALL SCREEN 100.
