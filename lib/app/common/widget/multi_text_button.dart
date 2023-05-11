import 'package:flutter/material.dart';

class MultTextButton extends StatelessWidget {
  const MultTextButton({
    Key? key,
    required this.onPressed,
    required this.children,
    this.overlayColor,
    this.padding,
  }) : super(key: key);

  final List<Text> children;
  final VoidCallback onPressed;
  final MaterialStateProperty<Color>? overlayColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: ButtonStyle(
          overlayColor:
              overlayColor ?? MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}