import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences prefs;
  ThemeCubit(this.prefs) : super(const ThemeState());

  Future<void> getThemeFromCatch() async {
    bool? isDarkMode = prefs.getBool('isDarkMode');
    if (isDarkMode != null) {
      emit(ThemeState(isDarkMode: isDarkMode));
    } else {
      await prefs.setBool('isDarkMode', false);
      emit(const ThemeState(isDarkMode: false));
    }
  }

  Future<void> changeTheme(bool isDarkMode) async {
    bool isDarkMode = !prefs.getBool('isDarkMode')!;
    await prefs.setBool('isDarkMode', isDarkMode);
    emit(ThemeState(isDarkMode: isDarkMode));
  }
}
