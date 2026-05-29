import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labradio/core/core.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key, this.icon = AppAssets.hamburger});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
