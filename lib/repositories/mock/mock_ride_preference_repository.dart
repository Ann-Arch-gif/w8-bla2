import '../../data/dummy_data.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../ride_preference_repository.dart';

///
/// Mock implementation of RidePreferenceRepository.
/// Uses in-memory list seeded with fake data.
///
class MockRidePreferenceRepository implements RidePreferenceRepository {
  final List<RidePreference> _history = List.from(fakeRidePrefs);

  @override
  Future<List<RidePreference>> getPreferenceHistory() async {
    return List.unmodifiable(_history);
  }

  @override
  Future<void> savePreference(RidePreference preference) async {
    _history.add(preference);
  }
}
