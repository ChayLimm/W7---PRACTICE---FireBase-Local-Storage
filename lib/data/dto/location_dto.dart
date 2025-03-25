import 'package:week_3_blabla_project/domain/model/location/locations.dart';



///
/// This model describes a location (city, street).
///
class LocationDTO {
  final String name;
  final Country country;

  const LocationDTO({required this.name, required this.country});

  static LocationDTO fromJson(Map<String, dynamic> json) {
    return LocationDTO(
      name: json['name'] as String,
      country: Country.values.firstWhere((e) => e.name == json['country'] as String),
    );
  }

  static Map<String, dynamic> toJson(LocationDTO location) {
    return {
      'name': location.name,
      'country': location.country.name,
    };
  }
}
