import 'package:cabeleleila/app/common/constants/routes.dart';
import 'package:cabeleleila/app/common/themes/default_theme.dart';
import 'package:cabeleleila/app/view/authentication/onboarding/onboarding_page.dart';
import 'package:cabeleleila/app/view/authentication/sign_in/sign_in_page.dart';
import 'package:cabeleleila/app/view/authentication/sign_up/sign_up_page.dart';
import 'package:cabeleleila/app/view/authentication/splash/splash_page.dart';
import 'package:cabeleleila/app/view/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnBoardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        NamedRoute.signIn: (context) => const SignInPage(),
        NamedRoute.home: (context) => const HomePage(),
      },
    );
  }
}
