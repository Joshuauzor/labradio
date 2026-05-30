import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labradio/core/core.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key, this.icon, this.onTap});

  final Widget? icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: icon ?? SvgPicture.asset(AppAssets.search),
      ),
    );
  }
}
