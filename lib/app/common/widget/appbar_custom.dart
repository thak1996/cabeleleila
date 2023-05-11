import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
    this.style,
  }) : super(key: key);

  final TextStyle? style;
  final String title;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.pinkOne,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        widget.title,
        style: widget.style ??
            AppTextStyles.mediumText22.apply(
              fontStyle: FontStyle.italic,
            ),
      ),
    );
  }
}


