import '../../domain/model/ride/ride.dart';
import '../../domain/model/ride/ride_filter.dart';
import '../../domain/model/ride/ride_pref.dart';

abstract class RidesRepository {
  List<Ride> getRidesFor(RidePreference ridePreference, RideFilter? rideFilter);
}
