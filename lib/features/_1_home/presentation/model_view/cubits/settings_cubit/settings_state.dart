part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLightAppTheme extends SettingsState {}

class SettingsDarkAppTheme extends SettingsState {}
