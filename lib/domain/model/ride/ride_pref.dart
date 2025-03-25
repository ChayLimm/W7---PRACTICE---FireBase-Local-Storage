import 'package:week_3_blabla_project/data/dto/location_dto.dart';
import 'package:week_3_blabla_project/data/dto/ride_preference_dto.dart';

import '../location/locations.dart';

///
/// This model describes a ride preference.
/// A ride preference consists of the selection of a departure + arrival + a date and a number of passenger
///
class RidePreference {
  final Location departure;
  final DateTime departureDate;
  final Location arrival;
  final int requestedSeats;

  const RidePreference(
      {required this.departure,
      required this.departureDate,
      required this.arrival,
      required this.requestedSeats});

  @override
  String toString() {
    return 'RidePref(departure: ${departure.name}, '
        'departureDate: ${departureDate.toIso8601String()}, '
        'arrival: ${arrival.name}, '
        'requestedSeats: $requestedSeats)';
  }
  static RidePreference fromDto(RidePreferencesDTO dto){
    return RidePreference(
      departure: Location(name: dto.departure.name, country: dto.departure.country ), 
      departureDate: dto.departureDate, 
      arrival: Location(name: dto.arrival.name, country: dto.arrival.country ), 
      requestedSeats: dto.requestedSeats
      );
  }
   static RidePreferencesDTO  toDto(RidePreference data){
    return RidePreferencesDTO(
      departure: LocationDTO(name: data.departure.name, country: data.departure.country ), 
      departureDate: data.departureDate, 
      arrival: LocationDTO(name: data.arrival.name, country: data.arrival.country), 
      requestedSeats: data.requestedSeats
      );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RidePreference) return false;

    return departure == other.departure &&
        departureDate == other.departureDate &&
        arrival == other.arrival &&
        requestedSeats == other.requestedSeats;
  }
}
