import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.helperText,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? helperText;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? labelText;
  final EdgeInsets? padding;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validator;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isHidden,
      validator: widget.validator,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      helperText: widget.helperText,
      keyboardType: widget.keyboardType,
      suffixIcon: InkWell(
        onTap: () => setState(() => isHidden = !isHidden),
        borderRadius: BorderRadius.circular(23),
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
          color: AppColors.pinkLogo,
        ),
      ),
    );
  }
}
