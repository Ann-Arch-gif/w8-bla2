import 'package:flutter/material.dart';
import '../states/ride_preference_state.dart';

///
/// InheritedNotifier that provides RidePreferenceState down the widget tree.
/// Automatically rebuilds dependents when the state notifies.
/// Access via: RidePreferenceStateProvider.of(context)
///
class RidePreferenceStateProvider
    extends InheritedNotifier<RidePreferenceState> {
  const RidePreferenceStateProvider({
    super.key,
    required RidePreferenceState state,
    required super.child,
  }) : super(notifier: state);

  static RidePreferenceState of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<
        RidePreferenceStateProvider>();
    assert(
        provider != null, 'No RidePreferenceStateProvider found in context');
    return provider!.notifier!;
  }
}
