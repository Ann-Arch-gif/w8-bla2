import 'main_common.dart';
import 'repositories/mock/mock_locations_repository.dart';
import 'repositories/mock/mock_rides_repository.dart';
import 'repositories/mock/mock_ride_preference_repository.dart';

///
/// Development entry point.
/// Injects mock repositories for local development and testing.
///
void main() {
  mainCommon(
    locationsRepository: MockLocationsRepository(),
    ridesRepository: MockRidesRepository(),
    ridePreferenceRepository: MockRidePreferenceRepository(),
  );
}
