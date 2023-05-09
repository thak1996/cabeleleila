import 'dart:developer';

import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:cabeleleila/app/common/constants/routes.dart';
import 'package:cabeleleila/app/common/utils/validator.dart';
import 'package:cabeleleila/app/common/widget/custom_circular_progress.indicator.dart';
import 'package:cabeleleila/app/common/widget/custom_cottom_sheet.dart';
import 'package:cabeleleila/app/common/widget/custom_text_form_field.dart';
import 'package:cabeleleila/app/common/widget/multi_text_button.dart';
import 'package:cabeleleila/app/common/widget/password_form_field.dart';
import 'package:cabeleleila/app/common/widget/primary_button_custom.dart';
import 'package:cabeleleila/app/locator.dart';
import 'package:cabeleleila/app/view/authentication/sign_up/sign_up_controller.dart';
import 'package:cabeleleila/app/view/authentication/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _controller = locator.get<SignUpController>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
        if (_controller.state is SignUpStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }
        if (_controller.state is SignUpStateSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, NamedRoute.home);
        }
        if (_controller.state is SignUpStateError) {
          final error = _controller.state as SignUpStateError;
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
              nameController: _nameController,
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
          'Agende seu horário \n agora mesmo!',
          style: AppTextStyles.mediumText.apply(
            color: AppColors.pinkOne,
          ),
        ),
      ],
    ),
  );
}

Form _bodySingUp({
  required GlobalKey<FormState> formKey,
  required TextEditingController passwordController,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required SignUpController controller,
}) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        CustomTextFormField(
          labelText: 'seu nome',
          keyboardType: TextInputType.name,
          enableSuggestions: true,
          hintText: 'MARIANA',
          validator: Validator.validateName,
          textInputAction: TextInputAction.next,
          controller: nameController,
        ),
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
          controller: passwordController,
          labelText: 'digite sua senha',
          keyboardType: TextInputType.visiblePassword,
          hintText: '***********',
          helperText:
              'Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número.',
          validator: Validator.validatePassword,
          textInputAction: TextInputAction.next,
        ),
        PasswordFormField(
          labelText: 'confirme sua senha',
          keyboardType: TextInputType.visiblePassword,
          hintText: '***********',
          textInputAction: TextInputAction.done,
          validator: (value) => Validator.validateConfirmPassword(
            value,
            passwordController.text,
          ),
        ),
        PrimaryButton(
          padding: const EdgeInsets.only(top: 20, bottom: 4),
          text: 'Criar conta',
          onPressed: () {
            final valid = formKey.currentState != null &&
                formKey.currentState!.validate();
            if (valid) {
              controller.signUp(
                name: nameController.text,
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
    onPressed: () => Navigator.pushReplacementNamed(context, NamedRoute.signIn),
    children: [
      Text(
        'Já tem uma conta? ',
        style: AppTextStyles.smallText.apply(
          color: AppColors.grey,
        ),
      ),
      Text(
        'Faça Login!',
        style: AppTextStyles.smallText.apply(
          color: AppColors.pinkOne,
        ),
      ),
    ],
  );
}
