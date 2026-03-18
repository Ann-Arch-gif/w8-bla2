import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../repositories/ride_preference_repository.dart';

///
/// Global state for ride preferences.
/// Holds the current selected preference and the history of past preferences.
/// Notifies listeners on any state change.
///
class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository _repository;

  RidePreference? _selectedPreference;
  List<RidePreference> _preferenceHistory = [];

  RidePreferenceState({required RidePreferenceRepository repository})
      : _repository = repository;

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory =>
      List.unmodifiable(_preferenceHistory);

  /// Loads preference history from the repository.
  Future<void> init() async {
    _preferenceHistory = await _repository.getPreferenceHistory();
    notifyListeners();
  }

  /// Selects a new preference.
  /// Updates history and notifies listeners only if preference changed.
  Future<void> selectPreference(RidePreference preference) async {
    if (preference == _selectedPreference) return;

    _selectedPreference = preference;
    _preferenceHistory.add(preference);
    await _repository.savePreference(preference);
    notifyListeners();
  }
}
