import 'package:flutter/material.dart';
import '../../providers/ride_preference_state_provider.dart';
import 'home_content.dart';
import 'home_view_model.dart';

///
/// HomeScreen creates and owns the HomeViewModel.
/// It listens to the view model and rebuilds HomeContent on changes.
///
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(
      ridePreferenceState: RidePreferenceStateProvider.of(context),
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
    return HomeContent(viewModel: _viewModel);
  }
}

