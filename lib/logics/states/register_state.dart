class RegisterState {
  String firstNameError;
  String lastNameError;
  String usernameError;
  String emailError;
  String passwordError;
  bool isLoading;
  bool isRegisterSuccess;

  RegisterState({
    this.firstNameError = '',
    this.lastNameError = '',
    this.usernameError = '',
    this.emailError = '',
    this.passwordError = '',
    this.isLoading = false,
    this.isRegisterSuccess = false,
    });

    RegisterState copyWith({
    String? firstNameError,
    String? lastNameError,
    String? usernameError,
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isRegisterSuccess,
    }) {
    return RegisterState(
      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      usernameError: usernameError ?? this.usernameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isLoading: isLoading ?? this.isLoading,
      isRegisterSuccess: isRegisterSuccess ?? this.isRegisterSuccess,
    );
    }
}