import '../../data/dummy_data.dart';
import '../../model/ride/locations.dart';
import '../locations_repository.dart';

///
/// Mock implementation of LocationsRepository.
/// Returns fake locations for development/testing.
///
class MockLocationsRepository implements LocationsRepository {
  @override
  Future<List<Location>> getLocations() async {
    return fakeLocations;
  }
}
