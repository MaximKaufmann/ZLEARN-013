CLASS zcl_fill_accounts_013 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      insert_data,
      update_data,
      delete_data.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_accounts_013 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*    DATA: lt_accounts TYPE TABLE OF zaccounts_013.

    "read current timestamp
*    GET TIME STAMP FIELD DATA(zv_tsl).

    "fill internal table
*    lt_accounts = VALUE #(
*
*        ( client ='100' account_number ='00000001' bank_customer_id ='100001' bank_name ='Volksbank' city = 'Gaertringen' balance ='200.00 ' currency ='EUR' account_category ='01' lastchangedat = zv_tsl )
*        ( client ='100' account_number ='00000002' bank_customer_id ='200002' bank_name ='Sparkasse' city ='Schwetzingen' balance ='500.00 ' currency ='EUR' account_category ='02' lastchangedat = zv_tsl )
*        ( client ='100' account_number ='00000003' bank_customer_id ='200003' bank_name ='Commerzbank' city ='Nuernberg' balance ='150.00 ' currency ='EUR' account_category ='02' lastchangedat = zv_tsl )
*    ).

    "Delete possible entries; insert new entries
*    DELETE FROM zaccounts_013.

*    INSERT zaccounts_013 FROM TABLE @lt_accounts.


    DATA(t013) = NEW zcl_fill_accounts_013(  ).

    t013->delete_data(  ).
    t013->insert_data(  ).


    SELECT zaccounts_013~bank_name FROM zaccounts_013 INTO TABLE @DATA(it_zaccounts_013).

    cl_demo_output=>display( it_zaccounts_013 ).

*    LOOP AT it_zaccounts_013 INTO DATA(bank_name).
*      out->write(  bank_name ).
*    ENDLOOP.



    "Check result in console
*    out->write( sy-dbcnt ).
    out->write(  'DONE!' ).
  ENDMETHOD.
**********************************************************************

  METHOD insert_data.
    DATA: lt_accounts TYPE TABLE OF zaccounts_013.

    "read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

    lt_accounts = VALUE #(

        ( client ='100' account_number ='00000001' bank_customer_id ='100001' bank_name ='Volksbank' city = 'Gaertringen' balance ='200.00 ' currency ='EUR' account_category ='01' lastchangedat = zv_tsl )
        ( client ='100' account_number ='00000002' bank_customer_id ='200002' bank_name ='Sparkasse' city ='Schwetzingen' balance ='500.00 ' currency ='EUR' account_category ='02' lastchangedat = zv_tsl )
        ( client ='100' account_number ='00000003' bank_customer_id ='200003' bank_name ='Commerzbank' city ='Nuernberg' balance ='150.00 ' currency ='EUR' account_category ='02' lastchangedat = zv_tsl )
    ).

    INSERT zaccounts_013 FROM TABLE @lt_accounts.

  ENDMETHOD.
**********************************************************************

  METHOD delete_data.

    "Delete possible entries; insert new entries
    DELETE FROM zaccounts_013.

  ENDMETHOD.
**********************************************************************


  METHOD update_data.

  ENDMETHOD.

ENDCLASS.
