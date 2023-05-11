import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/routes.dart';
import 'package:cabeleleila/app/common/widget/custom_circular_progress_indicator.dart';
import 'package:cabeleleila/app/view/authentication/splash/splash_controller.dart';
import 'package:cabeleleila/app/view/authentication/splash/splash_state.dart';
import 'package:cabeleleila/app/locator.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(
      () {
        if (_splashController.state is SplashStateSuccess) {
          Navigator.pushReplacementNamed(context, NamedRoute.home);
          log('Navegar para home');
        } else {
          Navigator.pushReplacementNamed(context, NamedRoute.initial);
          log('Navegar para onboarding');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.pinkThreGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo_cabeleleila_noName.png"),
            const SizedBox(height: 20),
            const CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
