import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/states/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
    : super(
        LoginState(
          emailError: '',
          passwordError: '',
          isLoading: false,
          isLoginSuccess: false,
        ),
      );

  bool validateEmail(String email) {
    final regexEmail = RegExp(r'^[^@]{2,}@gmail\.com$');
    return regexEmail.hasMatch(email);
  }

  bool validatePassword(String password) {
    final regexPassword = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return regexPassword.hasMatch(password);
  }

  void onchangeEmail(String email) {
    final isValid = validateEmail(email);
    emit(
      state.copyWith(
        emailError:
            isValid && email.isNotEmpty
                ? ''
                : 'Email must be in the format: user@gmail.com',
      ),
    );
  }

  void onchangePassword(String password) {
    final isValid = validatePassword(password);
    emit(
      state.copyWith(
        passwordError:
            isValid && password.isNotEmpty
                ? ''
                : 'Min 6 chars and require upper, lower, digit',
      ),
    );
  }

  bool get isFormValid {
    return state.emailError.isEmpty && state.passwordError.isEmpty;
  }

  void login(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 1));

    isFormValid
        ? emit(state.copyWith(isLoginSuccess: true, isLoading: false))
        : emit(state.copyWith(isLoginSuccess: false, isLoading: false));
  }
}
