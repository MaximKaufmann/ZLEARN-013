@AbapCatalog.sqlViewName: 'Z013DIMEAIRLINE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline'

@Analytics.dataCategory: #DIMENSION

define view Z_DIMEN_AIRLINE
  as select from scarr
{
      @ObjectModel.text.element: [ 'AirlineName' ]
  key carrid   as Airline,

      @Semantics.text: true
      carrname as AirlineName,

      @Semantics.currencyCode: true
      currcode as Currency
}
