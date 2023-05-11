import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:cabeleleila/app/common/constants/routes.dart';
import 'package:cabeleleila/app/common/utils/validator.dart';
import 'package:cabeleleila/app/common/widget/custom_circular_progress_indicator.dart';
import 'package:cabeleleila/app/common/widget/custom_bottom_sheet.dart';
import 'package:cabeleleila/app/common/widget/custom_text_form_field.dart';
import 'package:cabeleleila/app/common/widget/multi_text_button.dart';
import 'package:cabeleleila/app/common/widget/password_form_field.dart';
import 'package:cabeleleila/app/common/widget/primary_button_custom.dart';
import 'package:cabeleleila/app/locator.dart';
import 'package:cabeleleila/app/view/authentication/sign_in/sign_in_controller.dart';
import 'package:cabeleleila/app/view/authentication/sign_in/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _controller = locator.get<SignInController>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is SignInStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }
        if (_controller.state is SignInStateSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, NamedRoute.home);
        }
        if (_controller.state is SignInStateError) {
          final error = _controller.state as SignInStateError;
          Navigator.pop(context);
          customModalBottomSheet(
            context,
            content: error.message,
            buttonText: "Tentar novamente",
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            _headerSingUp(),
            _bodySingUp(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              controller: _controller,
            ),
            _footerSingUp(context),
          ],
        ),
      ),
    );
  }
}

Padding _headerSingUp() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Bem vindo de volta!',
          style: AppTextStyles.mediumText.apply(
            color: AppColors.pinkOne,
          ),
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}

Form _bodySingUp({
  required GlobalKey<FormState> formKey,
  required TextEditingController passwordController,
  required TextEditingController emailController,
  required SignInController controller,
}) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        CustomTextFormField(
          labelText: 'seu e-mail',
          keyboardType: TextInputType.emailAddress,
          enableSuggestions: true,
          hintText: 'email@email.com',
          validator: Validator.validateEmail,
          textInputAction: TextInputAction.next,
          controller: emailController,
        ),
        PasswordFormField(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          controller: passwordController,
          labelText: 'sua senha',
          keyboardType: TextInputType.visiblePassword,
          hintText: '***********',
          validator: Validator.validatePassword,
          textInputAction: TextInputAction.done,
          helperText:
              'Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número.',
        ),
        PrimaryButton(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          text: 'Login',
          onPressed: () {
            final valid = formKey.currentState != null &&
                formKey.currentState!.validate();
            if (valid) {
              controller.signIn(
                email: emailController.text,
                password: passwordController.text,
              );
            } else {
              log('erro ao logar');
            }
          },
        ),
      ],
    ),
  );
}

MultTextButton _footerSingUp(context) {
  return MultTextButton(
    onPressed: () => Navigator.pushReplacementNamed(context, NamedRoute.signUp),
    children: [
      Text(
        'Não tem uma conta? ',
        style: AppTextStyles.smallText.apply(
          color: AppColors.grey,
        ),
      ),
      Text(
        'Criar conta!',
        style: AppTextStyles.smallText.apply(
          color: AppColors.pinkOne,
        ),
      ),
    ],
  );
}
