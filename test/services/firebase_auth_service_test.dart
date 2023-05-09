import 'package:cabeleleila/app/common/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../mock/mock_classes.dart';


void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      name: "User",
      email: "email@email.com",
      id: "1a2b3c4d5e",
    );
  });

  group("Test sign_up", () {
    test('Test Sign up sucess', () async {
      when(
        () => mockFirebaseAuthService.signUp(
          name: "User",
          email: "email@email.com",
          password: "user@123",
        ),
      ).thenAnswer((_) async => user);
      final result = await mockFirebaseAuthService.signUp(
        name: "User",
        email: "email@email.com",
        password: "user@123",
      );
      expect(
        result,
        user,
      );
    });

    test('Test Sign up failure', () async {
      when(
        () => mockFirebaseAuthService.signUp(
          name: "User",
          email: "email@email.com",
          password: "user@123",
        ),
      ).thenThrow(Exception());
      expect(
        () => mockFirebaseAuthService.signUp(
          name: "User",
          email: "email@email.com",
          password: "user@123",
        ),
        throwsException,
      );
    });
  });
}
