@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view from /DMO/I_BOOKING_U'
@Metadata.allowExtensions: true
define view entity Z_I_BOOKING_013
  as select from /DMO/I_Booking_U
  association [1..1] to /DMO/I_Connection       as _Connection on $projection.ConnectionID = _Connection.ConnectionID
  association        to parent Z_I_TRAVEL_R_013 as _Travel     on $projection.TravelID = _Travel.TravelID
{
  key TravelID,
  key BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'Currency_Code'
      FlightPrice              as Flight_Price,

      //      @Semantics.currencyCode: true
      CurrencyCode             as Currency_Code,
      LastChangedAt,


      /* Associations */
      _BookSupplement,
      _Carrier,
      _Connection,
      _Customer,
      _Travel, // Make association public
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      _Connection.Distance     as Distance,

      _Connection.DistanceUnit as DistanceUnit,
      case
      when _Connection.Distance >= 2000 then 'long-haul flight'
      when _Connection.Distance >= 1000 and
      _Connection.Distance <  2000 then 'medium-haul flight'
      when _Connection.Distance <  1000 then 'short-haul flight'
                      else 'error'
      end                      as Flight_type
}
where
_Connection.DistanceUnit = 'KM'
