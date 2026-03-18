import 'package:flutter/material.dart';
import '../../providers/repositories_provider.dart';
import '../../providers/ride_preference_state_provider.dart';
import 'ride_selection_content.dart';
import 'ride_selection_view_model.dart';

///
/// RidesSelectionScreen creates and owns the RideSelectionViewModel.
/// It listens to the view model and rebuilds RideSelectionContent on changes.
///
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late final RideSelectionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RideSelectionViewModel(
      ridePreferenceState: RidePreferenceStateProvider.of(context),
      ridesRepository: RepositoriesProvider.of(context).ridesRepository,
    );
    _viewModel.addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RideSelectionContent(viewModel: _viewModel);
  }
}

