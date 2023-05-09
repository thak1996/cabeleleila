import 'package:cabeleleila/app/services/auth_service.dart';
import 'package:cabeleleila/app/services/secure_storage.dart';
import 'package:cabeleleila/app/view/authentication/sign_in/sign_in_state.dart';
import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  SignInController(this._service);

  final AuthService _service;
  SignInState _state = SignInStateInitial();

  SignInState get state => _state;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    const secureStorage = SecureStorage();
    _changeState(SignInStateLoading());
    try {
      final user = await _service.signIn(
        email: email,
        password: password,
      );

      if (user.id != null) {
        await secureStorage.write(key: "CURRENT_USER", value: user.toJson());

        _changeState(SignInStateSuccess());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }
}
