import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.padding,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.floatingLabelBehavior,
    this.enableSuggestions,
    this.textCapitalization,
    this.controller,
    this.maxLength,
    this.maxLines,
    this.textInputAction,
    this.keyboardAppearance,
    this.style,
    this.helperText,
    this.validator,
    this.helperStyle,
    this.suffixIcon,
    this.obscureText,
    this.inputFormatters,
    this.helperMaxLines,
    this.errorMaxLines,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool? enableSuggestions;
  final int? errorMaxLines;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final int? helperMaxLines;
  final TextStyle? helperStyle;
  final String? helperText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? maxLength;
  final int? maxLines;
  final bool? obscureText;
  final EdgeInsets? padding;
  final TextStyle? style;
  final Widget? suffixIcon;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.pinkOne,
      width: 1.4,
    ),
  );

  String? _helperText;

  @override
  void initState() {
    _helperText = widget.helperText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            setState(() {
              _helperText = null;
            });
          } else if (value.isEmpty) {
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,
        keyboardAppearance: widget.keyboardAppearance ?? Brightness.light,
        style: widget.style ??
            AppTextStyles.smallText.apply(
              color: AppColors.grey,
            ),
        textInputAction: widget.textInputAction ?? TextInputAction.none,
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxLength,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        enableSuggestions: widget.enableSuggestions ?? true,
        keyboardType: widget.keyboardType ?? TextInputType.none,
        decoration: InputDecoration(
          errorMaxLines: widget.errorMaxLines ?? 3,
          suffixIcon: widget.suffixIcon,
          helperMaxLines: widget.helperMaxLines ?? 3,
          helperText: _helperText,
          helperStyle: widget.helperStyle ??
              AppTextStyles.inputText.apply(
                color: AppColors.pinkOne,
              ),
          labelText: widget.labelText?.toUpperCase(),
          floatingLabelStyle: AppTextStyles.inputText.apply(
            color: AppColors.darkGrey,
          ),
          labelStyle: AppTextStyles.inputText.apply(
            color: AppColors.darkGrey,
          ),
          floatingLabelBehavior:
              widget.floatingLabelBehavior ?? FloatingLabelBehavior.always,
          hintText: widget.hintText,
          focusedBorder: defaultBorder,
          errorStyle: AppTextStyles.inputHintText.apply(color: Colors.red),
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
