import 'package:flutter/material.dart';
import 'package:labradio/core/core.dart';
import 'package:shimmer/shimmer.dart';

class LazyLoader extends StatelessWidget {
  const LazyLoader({
    super.key,
    this.baseColor,
    this.highlightColor,
    this.height = 16,
    this.width = 16,
    this.borderRadius = 8,
    this.color,
  });

  final Color? baseColor;
  final Color? highlightColor;
  final double height;
  final double width;
  final double borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.primary,
      highlightColor: highlightColor ?? AppColors.secondary,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: highlightColor ?? AppColors.shadow,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
