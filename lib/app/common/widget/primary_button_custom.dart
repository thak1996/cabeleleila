import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key? key,
    this.onPressed,
    this.padding,
    required this.text,
  }) : super(key: key);
  final BorderRadius _borderRadius = BorderRadius.circular(48);
  final VoidCallback? onPressed;
  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 10,
        shadowColor: Colors.black,
        borderRadius: _borderRadius,
        child: Ink(
          height: 48,
          width: MediaQuery.of(context).size.width * .75,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: onPressed != null
                  ? AppColors.pinkTwoGradient
                  : AppColors.pinkGradient,
            ),
          ),
          child: InkWell(
            borderRadius: _borderRadius,
            onTap: onPressed,
            child: Align(
              child: Text(
                text,
                style: AppTextStyles.mediumText18.apply(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
