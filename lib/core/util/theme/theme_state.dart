part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({this.isDarkMode = false});

  final bool isDarkMode;

  @override
  List<Object> get props => [isDarkMode];
}
