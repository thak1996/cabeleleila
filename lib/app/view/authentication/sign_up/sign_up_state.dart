abstract class SignUpState {}

class SignUpStateInitial extends SignUpState {}

class SignUpStateLoading extends SignUpState {}

class SignUpStateSuccess extends SignUpState {}

class SignUpStateError extends SignUpState {
  SignUpStateError(this.message);

  final String message;
}