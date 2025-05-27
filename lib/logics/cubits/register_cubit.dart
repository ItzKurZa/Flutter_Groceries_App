import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/states/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
    : super(
        RegisterState(
          emailError: "",
          firstNameError: "",
          lastNameError: "",
          usernameError: "",
          passwordError: "",
          isLoading: false,
          isRegisterSuccess: false,
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

  void onchangeFirstName(String firstName) {
    emit(
      state.copyWith(
        firstNameError: firstName.isNotEmpty ? '' : 'First name is required',
      ),
    );
  }

  void onchangeLastName(String lastName) {
    emit(
      state.copyWith(
        lastNameError: lastName.isNotEmpty ? '' : 'Last name is required',
      ),
    );
  }

  void onchangeUsername(String username) {
    emit(
      state.copyWith(
        usernameError: username.isNotEmpty ? '' : 'Username is required',
      ),
    );
  }

  bool get isFormValid {
    return state.emailError.isEmpty &&
        state.passwordError.isEmpty &&
        state.firstNameError.isEmpty &&
        state.lastNameError.isEmpty &&
        state.usernameError.isEmpty;
  }

  void register(
    String firstName,
    String lastName,
    String username,
    String email,
    String password,
  ) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 1));

    isFormValid
        ? emit(state.copyWith(isLoading: false, isRegisterSuccess: true))
        : emit(state.copyWith(isLoading: false, isRegisterSuccess: false));
  }
}
