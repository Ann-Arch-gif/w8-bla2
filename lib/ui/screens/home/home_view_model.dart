import 'package:flutter/material.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../ui/states/ride_preference_state.dart';

///
/// HomeViewModel manages the business logic for the home screen.
/// Listens to RidePreferenceState and notifies the screen on changes.
///
class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;

  HomeViewModel({required RidePreferenceState ridePreferenceState})
      : _ridePreferenceState = ridePreferenceState {
    _ridePreferenceState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference? get currentPreference =>
      _ridePreferenceState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceState.preferenceHistory;

  Future<void> selectPreference(RidePreference preference) async {
    await _ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(_onStateChanged);
    super.dispose();
  }
}
