@AbapCatalog.sqlViewName: 'Z013DIMECONNECT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Connection'

@Analytics.dataCategory: #DIMENSION

@ObjectModel.representativeKey: 'FlightConnection'

define view Z_DIMEN_Connection
  as select from spfli
  association [0..1] to Z_DIMEN_AIRLINE as _Airline on $projection.Airline = _Airline.Airline

{
      @ObjectModel.foreignKey.association: '_Airline'
  key carrid                    as Airline,

      @ObjectModel.text.element: [ 'Destination' ]
  key connid                    as FlightConnection,

      @Semantics.text: true
      concat(cityfrom,
        concat(' -> ', cityto)) as Destination,

      _Airline
}
