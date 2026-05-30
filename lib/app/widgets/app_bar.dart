import 'package:flutter/material.dart';
import 'package:labradio/app/app.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    required this.title,
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.leading,
    this.titleColor,
    this.action,
    this.centerTitle,
  });

  final String title;
  final Color? titleColor;
  final Widget? leading;
  final Widget? action;
  final double fontSize;
  final FontWeight fontWeight;
  final bool? centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: leading,
      title: TextRegular(
        title,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: titleColor ?? Theme.of(context).textTheme.bodyMedium?.color,
      ),
      actions: [if (action != null) action!],
      centerTitle: centerTitle,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }
}
