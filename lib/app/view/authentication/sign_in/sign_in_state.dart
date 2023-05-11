abstract class SignInState {}

class SignInStateInitial extends SignInState {}

class SignInStateLoading extends SignInState {}

class SignInStateSuccess extends SignInState {}

class SignInStateError extends SignInState {
  SignInStateError(this.message);

  final String message;
}