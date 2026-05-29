import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labradio/core/core.dart';

class PhotoHolder extends StatelessWidget {
  const PhotoHolder({
    required this.image,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 100,
    this.placeholder,
    super.key,
  });

  final double height;
  final double width;
  final String? image;
  final double borderRadius;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOutCubicEmphasized,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: image ?? '',
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            );
          },
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Center(
                child:
                    placeholder ??
                    SvgPicture.asset(AppAssets.info, fit: BoxFit.cover),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Center(
                child:
                    placeholder ??
                    SvgPicture.asset(AppAssets.info, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
