import 'package:cabeleleila/app/common/models/user_model.dart';
import 'package:cabeleleila/app/view/authentication/sign_up/sign_up_controller.dart';
import 'package:cabeleleila/app/view/authentication/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockSecureStorage = MockSecureStorage();
    signUpController = SignUpController(
      mockFirebaseAuthService,
      mockSecureStorage,
    );
    user = UserModel(
      name: "User",
      email: "email@email.com",
      id: "1a2b3c4d5e",
    );
  });

  test("Test Sign Up Controller Sucess State", () async {
    expect(signUpController.state, isInstanceOf<SignUpStateInitial>());
    when(() => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        )).thenAnswer((_) async {});
    when(
      () => mockFirebaseAuthService.signUp(
        name: "User",
        email: "email@email.com",
        password: "user@123",
      ),
    ).thenAnswer(
      (_) async => user,
    );
    await signUpController.signUp(
      name: "User",
      email: "email@email.com",
      password: "user@123",
    );
    expect(signUpController.state, isInstanceOf<SignUpStateSuccess>());
  });

  test("Test Sign Up Controller Error State", () async {
    expect(signUpController.state, isInstanceOf<SignUpStateInitial>());
    when(() => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        )).thenAnswer((_) async {});
    when(
      () => mockFirebaseAuthService.signUp(
        name: "User",
        email: "email@email.com",
        password: "user@123",
      ),
    ).thenThrow(Exception());
    await signUpController.signUp(
      name: "User",
      email: "email@email.com",
      password: "user@123",
    );
    expect(signUpController.state, isInstanceOf<SignUpStateError>());
  });
}
