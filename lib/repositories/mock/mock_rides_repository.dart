import '../../data/dummy_data.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../rides_repository.dart';

///
/// Mock implementation of RidesRepository.
/// Returns fake rides filtered by the given ride preference.
///
class MockRidesRepository implements RidesRepository {
  @override
  Future<List<Ride>> getRidesFor(RidePreference preference) async {
    return fakeRides
        .where(
          (ride) =>
              ride.departureLocation == preference.departure &&
              ride.arrivalLocation == preference.arrival &&
              ride.availableSeats >= preference.requestedSeats,
        )
        .toList();
  }
}
