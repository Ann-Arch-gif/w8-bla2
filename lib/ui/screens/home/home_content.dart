import 'package:flutter/material.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart';
import '../../theme/theme.dart';
import '../../widgets/pickers/bla_ride_preference_picker.dart';
import '../rides_selection/rides_selection_screen.dart';
import 'home_view_model.dart';
import 'widgets/home_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// HomeContent is a stateless widget that renders the home UI.
/// It receives a HomeViewModel and reacts to its notifications.
///
class HomeContent extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_buildBackground(), _buildForeground(context)],
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildForeground(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),
        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlaRidePreferencePicker(
                initRidePreference: viewModel.currentPreference,
                onRidePreferenceSelected: (pref) =>
                    _onRidePrefSelected(context, pref),
              ),
              SizedBox(height: BlaSpacings.m),
              _buildHistory(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context) {
    final history = viewModel.preferenceHistory.reversed.toList();
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () => _onRidePrefSelected(context, history[index]),
        ),
      ),
    );
  }

  Future<void> _onRidePrefSelected(
      BuildContext context, RidePreference preference) async {
    await viewModel.selectPreference(preference);
    if (context.mounted) {
      await Navigator.of(context).push(
        AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()),
      );
    }
  }
}
