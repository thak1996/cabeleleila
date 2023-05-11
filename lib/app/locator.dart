import 'package:cabeleleila/app/services/auth_service.dart';
import 'package:cabeleleila/app/services/bookmarks_service.dart';
import 'package:cabeleleila/app/services/firebase/firebase_auth_service.dart';
import 'package:cabeleleila/app/services/secure_storage.dart';
import 'package:cabeleleila/app/view/authentication/sign_in/sign_in_controller.dart';
import 'package:cabeleleila/app/view/authentication/sign_up/sign_up_controller.dart';
import 'package:cabeleleila/app/view/authentication/splash/splash_controller.dart';
import 'package:cabeleleila/app/view/home/appbar_pages/bookmarks/bookmarks_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SplashController>(
    () => SplashController(const SecureStorage()),
  );

  locator.registerFactory<SignInController>(
    () => SignInController(locator.get<AuthService>()),
  );

  locator.registerFactory<SignUpController>(
    () => SignUpController(locator.get<AuthService>(), const SecureStorage()),
  );

//   locator.registerFactory<BookmarksController>(
//     () => BookmarksController(locator.get<BookmarksService>()),
//   );
}
