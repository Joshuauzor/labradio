import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';

class StationItem extends StatelessWidget {
  const StationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondary,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 27,
            offset: const Offset(0, 4),
          ),
        ],
        // border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          PhotoHolder(
            image: 'https://via.placeholder.com/150',
            width: 90,
            height: 90,
            borderRadius: 8,
          ),
          Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBold('Station Name', fontSize: 16),
                Gap(4),
                TextRegular(
                  'Station Location',
                  color: AppColors.outline,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                Gap(4),
                TextRegular(
                  'Station Language',
                  color: AppColors.outline,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          Gap(16),
          SvgPicture.asset(AppAssets.favorite),
        ],
      ),
    );
  }
}
