import 'package:flutter/material.dart';
import 'package:w8/repositories/locations_repository.dart';
import 'package:w8/repositories/rides_repository.dart';
import 'package:w8/repositories/ride_preference_repository.dart';

///
/// InheritedWidget that provides all repositories down the widget tree.
/// Access via: RepositoriesProvider.of(context)
///
class RepositoriesProvider extends InheritedWidget {
  final LocationsRepository locationsRepository;
  final RidesRepository ridesRepository;
  final RidePreferenceRepository ridePreferenceRepository;

  const RepositoriesProvider({
    super.key,
    required this.locationsRepository,
    required this.ridesRepository,
    required this.ridePreferenceRepository,
    required super.child,
  });

  static RepositoriesProvider of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<RepositoriesProvider>();
    assert(provider != null, 'No RepositoriesProvider found in context');
    return provider!;
  }

  @override
  bool updateShouldNotify(RepositoriesProvider oldWidget) =>
      locationsRepository != oldWidget.locationsRepository ||
      ridesRepository != oldWidget.ridesRepository ||
      ridePreferenceRepository != oldWidget.ridePreferenceRepository;
}
