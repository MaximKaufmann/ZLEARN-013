*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZGR1AJ_DB_FIZZB.................................*
DATA:  BEGIN OF STATUS_ZGR1AJ_DB_FIZZB               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZGR1AJ_DB_FIZZB               .
CONTROLS: TCTRL_ZGR1AJ_DB_FIZZB
            TYPE TABLEVIEW USING SCREEN '0100'.
*.........table declarations:.................................*
TABLES: *ZGR1AJ_DB_FIZZB               .
TABLES: ZGR1AJ_DB_FIZZB                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
