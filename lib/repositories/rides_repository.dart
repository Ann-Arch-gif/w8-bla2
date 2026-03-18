import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';

///
/// Abstract repository for rides.
/// Defines the contract for fetching rides.
///
abstract class RidesRepository {
  Future<List<Ride>> getRidesFor(RidePreference preference);
}
