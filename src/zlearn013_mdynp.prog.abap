*&---------------------------------------------------------------------*
*& Report ZLEARN013_MDYNP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE zlearn013_mdynp_top                     .    " Global Data

TABLES: ZLEARN013_MDYNP.

LOad-OF-PROGRAM.

DATA(lo_cc) = NEW cl_gui_custom_container( container_name = 'CCONTAINER_SALV').
DATA(lo_alv) = cl_salv_gui_table_ida=>create(
    iv_table_name = 'ZLEARN013_MDYNP'
    io_gui_container = lo_cc
).

INCLUDE zlearn013_mdynp_o01                     .  " PBO-Modules
INCLUDE zlearn013_mdynp_i01                     .  " PAI-Modules
INCLUDE zlearn013_mdynp_f01                     .  " FORM-Routines


START-OF-SELECTION.
  CALL SCREEN 100.
