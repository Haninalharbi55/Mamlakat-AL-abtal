import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/change_language_usecase.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final ChangeLanguageUseCase changeLanguageUseCase;

  SettingsCubit(this.changeLanguageUseCase) : super(const SettingsInitial());

  Future<void> changeLanguage(String language) async {
    try {
      await changeLanguageUseCase(language);
      emit(SettingsInitial(language: language));
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  void toggleTheme() {
    final currentState = state;
    if (currentState is SettingsInitial) {
      emit(SettingsInitial(
        language: currentState.language,
        isDarkMode: !currentState.isDarkMode,
      ));
    }
  }
}
