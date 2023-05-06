@AbapCatalog.sqlViewName: 'Z013_SQL_ODATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view with OData Service -> Fiori App'
@OData.publish: true

define view Z013_CDS_ODATA_VIEW
  as select from vbak as shead
  association [1] to vbap as _sitem on shead.vbeln = _sitem.vbeln
{
  key shead.vbeln,
      _sitem // make association public
}
