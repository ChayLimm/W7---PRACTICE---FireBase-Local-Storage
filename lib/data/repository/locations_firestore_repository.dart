import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:week_3_blabla_project/data/repository/locations_repository.dart';
import 'package:week_3_blabla_project/domain/model/location/locations.dart';

class LocationsFirestoreRepository extends LocationsRepository {
  @override
  Future<List<Location>> getLocations() async {
    try {
      final url = Uri.parse('https://blablacar-9f7e4-default-rtdb.firebaseio.com/locations.json');
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw "error in fetching";
      }

      final dynamic jsonData = jsonDecode(response.body);

      List<dynamic> locationsList;
      
      // Handle Firebase's Map response format
      if (jsonData is Map) {
        locationsList = jsonData.values.toList();
      } else if (jsonData is List) {
        locationsList = jsonData;
      } else {
        throw 'Unexpected data format';
      }

      final locations = locationsList.map<Location>((json) => Location.fromJson(json))
          .toList();

      return locations;
    } catch (e) {
      print('Stack trace: $e');
      return [];
    }
  }
}