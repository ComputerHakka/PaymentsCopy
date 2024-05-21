part of 'landing_page_bloc.dart';

@immutable
sealed class LandingPageEvent {}

class TabChangeEvent extends LandingPageEvent {
  final int tabIndex;

  TabChangeEvent({required this.tabIndex});
}
