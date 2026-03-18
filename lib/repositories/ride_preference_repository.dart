import '../model/ride_pref/ride_pref.dart';

///
/// Abstract repository for ride preferences.
/// Defines the contract for fetching and saving preference history.
///
abstract class RidePreferenceRepository {
  Future<List<RidePreference>> getPreferenceHistory();
  Future<void> savePreference(RidePreference preference);
}
