import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:cabeleleila/app/common/constants/routes.dart';
import 'package:cabeleleila/app/common/widget/multi_text_button.dart';
import 'package:cabeleleila/app/common/widget/primary_button_custom.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            _imageOnboarding(),
            _infosOnboarding(context),
          ],
        ),
      ),
    );
  }
}

Container _imageOnboarding() {
  return Container(
    padding: const EdgeInsets.all(6),
    child: Image.asset('assets/images/logo_cabeleleila.png'),
  );
}

Container _infosOnboarding(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 20),
    height: MediaQuery.of(context).size.height * .4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _textTitle(),
        _buttonOnboarding(context),
        _textButton(context),
      ],
    ),
  );
}

Text _textTitle() {
  return Text(
    textAlign: TextAlign.center,
    'Ser Cabeleireiro é trazer para fora a \nBeleza que existe dentro de você',
    style: AppTextStyles.mediumText20.apply(
      color: AppColors.pinkOne,
    ),
  );
}

PrimaryButton _buttonOnboarding(context) {
  return PrimaryButton(
    padding: const EdgeInsets.only(top: 40, bottom: 10),
    text: 'Comece aqui!',
    onPressed: () => Navigator.pushNamed(context, NamedRoute.signUp),
  );
}

MultTextButton _textButton(context) {
  return MultTextButton(
    onPressed: () => Navigator.pushNamed(context, NamedRoute.signIn),
    children: [
      Text(
        'Já tem uma conta? ',
        style: AppTextStyles.smallText.apply(color: AppColors.grey),
      ),
      Text(
        'Login',
        style: AppTextStyles.smallText.apply(color: AppColors.pinkOne),
      ),
    ],
  );
}
