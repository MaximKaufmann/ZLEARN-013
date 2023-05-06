*&---------------------------------------------------------------------*
*& Report z013_invoice_items_eur
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z013_invoice_items_eur_013.

class lcl_main definition create private.

  public section.
    CLASS-METHODS create
      RETURNING
        value(r_result) TYPE REF TO lcl_main.
        METHODS run.
  protected section.
  private section.

endclass.

class lcl_main implementation.

  method create.

    r_result = new #( ).

  endmethod.

  method run.
    cl_salv_gui_table_ida=>create_for_cds_view( 'Z_Invoice_Items_013' )->fullscreen( )->display( ).
  endmethod.

endclass.

START-OF-SELECTION.
    lcl_main=>create( )->run( ).
