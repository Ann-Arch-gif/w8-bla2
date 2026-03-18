import 'package:flutter/material.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart';
import '../../theme/theme.dart';
import 'ride_selection_view_model.dart';
import 'widgets/ride_preference_modal.dart';
import 'widgets/rides_selection_header.dart';
import 'widgets/rides_selection_tile.dart';

///
/// RideSelectionContent is a stateless widget that renders the ride selection UI.
/// It receives a RideSelectionViewModel and reacts to its data.
///
class RideSelectionContent extends StatelessWidget {
  final RideSelectionViewModel viewModel;

  const RideSelectionContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final preference = viewModel.currentPreference;
    if (preference == null) {
      return const Scaffold(
        body: Center(child: Text("No ride preference selected.")),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: preference,
              onBackPressed: () => Navigator.pop(context),
              onFilterPressed: () {},
              onPreferencePressed: () =>
                  _onPreferencePressed(context, preference),
            ),
            SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: viewModel.matchingRides[index],
                  onPressed: () => _onRideSelected(viewModel.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onRideSelected(Ride ride) {
    // Later
  }

  Future<void> _onPreferencePressed(
      BuildContext context, RidePreference current) async {
    final RidePreference? newPreference =
        await Navigator.of(context).push<RidePreference>(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(initialPreference: current),
      ),
    );

    if (newPreference != null) {
      await viewModel.selectPreference(newPreference);
    }
  }
}
