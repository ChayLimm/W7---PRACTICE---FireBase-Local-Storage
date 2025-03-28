import '../../domain/model/location/locations.dart';

abstract class LocationsRepository {
  Future<List<Location>> getLocations();
}
