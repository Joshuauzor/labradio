import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';

class StationItem extends StatelessWidget {
  const StationItem({
    required this.name,
    required this.location,
    required this.language,
    required this.logo,
    required this.onFavorite,
    required this.isFavorite,
    super.key,
    this.onTap,
  });

  final String name;
  final String? location;
  final String? language;
  final String? logo;
  final VoidCallback onFavorite;
  final bool isFavorite;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondary,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 27,
            offset: Offset(0, 4),
          ),
        ],
        // border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  PhotoHolder(
                    image: logo,
                    width: 90,
                    height: 90,
                    borderRadius: 8,
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(name),
                        const Gap(4),
                        TextRegular(
                          location ?? 'N/A',
                          color: AppColors.outline,
                          fontSize: 14,
                          maxLines: 1,
                        ),
                        const Gap(4),
                        TextRegular(
                          language ?? 'N/A',
                          color: AppColors.outline,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onFavorite,
            behavior: HitTestBehavior.opaque,
            child: SvgPicture.asset(
              isFavorite ? AppAssets.favoriteFilled : AppAssets.favorite,
            ),
          ),
        ],
      ),
    );
  }
}
