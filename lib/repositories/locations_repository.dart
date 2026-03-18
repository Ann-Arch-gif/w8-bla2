import '../model/ride/locations.dart';

///
/// Abstract repository for locations.
/// Defines the contract for fetching available locations.
///
abstract class LocationsRepository {
  Future<List<Location>> getLocations();
}
