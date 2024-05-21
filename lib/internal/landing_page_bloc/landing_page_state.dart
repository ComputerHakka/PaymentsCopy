part of 'landing_page_bloc.dart';

@immutable
sealed class LandingPageState {
  final int tabIndex;

  const LandingPageState({required this.tabIndex});
}

final class LandingPageInitial extends LandingPageState {
  const LandingPageInitial({required super.tabIndex});
}
