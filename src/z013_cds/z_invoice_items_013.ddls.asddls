@AbapCatalog.sqlViewName: 'Z_ITEMS_013'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Items'
define view Z_INVOICE_ITEMS_013
  as select from sepm_sddl_so_invoice_item
{
  header.buyer.company_name,
  sepm_sddl_so_invoice_item.sales_order_invoice_key,
  sepm_sddl_so_invoice_item.currency_code,
  sepm_sddl_so_invoice_item.gross_amount,
  @EndUserText.label: 'payment_status'
  case header.payment_status
      when 'P' then 'X'
      else ' '
  end as  payment_status,
  
  
  //*Associations*//
  header

}

where currency_code = 'USD'
