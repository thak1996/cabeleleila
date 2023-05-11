import 'package:cabeleleila/app/services/auth_service.dart';
import 'package:cabeleleila/app/services/secure_storage.dart';
import 'package:cabeleleila/app/view/authentication/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  SignUpController(this._service, this._secureStorage);

  final SecureStorage _secureStorage;
  final AuthService _service;
  SignUpState _state = SignUpStateInitial();

  SignUpState get state => _state;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _changeState(SignUpStateLoading());
    try {
      final user = await _service.signUp(
        name: name,
        email: email,
        password: password,
      );
      if (user.id != null) {
        await _secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );
        _changeState(SignUpStateSuccess());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignUpStateError(e.toString()));
    }
  }

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }
}
