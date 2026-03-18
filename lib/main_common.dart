import 'package:flutter/material.dart';
import 'package:w8/ui/theme/theme.dart';
import 'package:w8/ui/screens/home/home_screen.dart';
import 'package:w8/ui/providers/repositories_provider.dart';
import 'repositories/locations_repository.dart';
import 'repositories/rides_repository.dart';
import 'repositories/ride_preference_repository.dart';

///
/// Common app entry point shared across environments.
/// Receives all repositories from the specific environment main file.
///
void mainCommon({
  required LocationsRepository locationsRepository,
  required RidesRepository ridesRepository,
  required RidePreferenceRepository ridePreferenceRepository,
}) {
  runApp(
    BlaBlaApp(
      locationsRepository: locationsRepository,
      ridesRepository: ridesRepository,
      ridePreferenceRepository: ridePreferenceRepository,
    ),
  );
}

class BlaBlaApp extends StatelessWidget {
  final LocationsRepository locationsRepository;
  final RidesRepository ridesRepository;
  final RidePreferenceRepository ridePreferenceRepository;

  const BlaBlaApp({
    super.key,
    required this.locationsRepository,
    required this.ridesRepository,
    required this.ridePreferenceRepository,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoriesProvider(
      locationsRepository: locationsRepository,
      ridesRepository: ridesRepository,
      ridePreferenceRepository: ridePreferenceRepository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: blaTheme,
        home: Scaffold(body: HomeScreen()),
      ),
    );
  }
}
