import 'package:flutter/material.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../repositories/rides_repository.dart';
import '../../../ui/states/ride_preference_state.dart';

///
/// RideSelectionViewModel manages the business logic for the ride selection screen.
/// Listens to RidePreferenceState and fetches matching rides from RidesRepository.
///
class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;
  final RidesRepository _ridesRepository;

  List<Ride> _matchingRides = [];

  RideSelectionViewModel({
    required RidePreferenceState ridePreferenceState,
    required RidesRepository ridesRepository,
  })  : _ridePreferenceState = ridePreferenceState,
        _ridesRepository = ridesRepository {
    _ridePreferenceState.addListener(_onStateChanged);
    _fetchRides();
  }

  RidePreference? get currentPreference =>
      _ridePreferenceState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceState.preferenceHistory;

  List<Ride> get matchingRides => List.unmodifiable(_matchingRides);

  Future<void> selectPreference(RidePreference preference) async {
    await _ridePreferenceState.selectPreference(preference);
  }

  void _onStateChanged() {
    _fetchRides();
  }

  Future<void> _fetchRides() async {
    if (currentPreference == null) {
      _matchingRides = [];
      notifyListeners();
      return;
    }
    _matchingRides = await _ridesRepository.getRidesFor(currentPreference!);
    notifyListeners();
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(_onStateChanged);
    super.dispose();
  }
}
