import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    required this.onTap,
    required this.icon,
    this.width = 64,
    this.height = 64,
    this.iconSize = 24,
    super.key,
  });

  final VoidCallback? onTap;
  final double width;
  final double height;
  final double iconSize;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 109, 74, 74),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: SvgPicture.asset(width: iconSize, height: iconSize, icon),
        ),
      ),
    );
  }
}
