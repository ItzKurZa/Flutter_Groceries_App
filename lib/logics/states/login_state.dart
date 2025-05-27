class LoginState {
  final String emailError;
  final String passwordError;
  final bool isLoading;
  final bool isLoginSuccess;

  LoginState({
    required this.emailError,
    required this.passwordError,
    required this.isLoading,
    this.isLoginSuccess = false,
  });

  LoginState copyWith({
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isLoginSuccess,
  }) {
    return LoginState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
