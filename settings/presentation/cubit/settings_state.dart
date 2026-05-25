import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {
  final String language;
  final bool isDarkMode;

  const SettingsInitial({
    this.language = 'ar',
    this.isDarkMode = false,
  });

  @override
  List<Object> get props => [language, isDarkMode];
}

class SettingsLoading extends SettingsState {}

class SettingsError extends SettingsState {
  final String message;

  const SettingsError(this.message);

  @override
  List<Object> get props => [message];
}
