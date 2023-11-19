import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool _isDark = true;
  String _difficulty = "";

  void changeAppTheme() {
    if (_isDark) {
      _isDark = false;
      emit(SettingsLightAppTheme());
    } else {
      _isDark = true;
      emit(SettingsDarkAppTheme());
    }
  }

  bool getApptheme() => _isDark;

  void setDifficulty(String difficulty) {
    _difficulty = difficulty;
  }

  String getDifficulty() => _difficulty;
}
