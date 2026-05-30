import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';

class StationLoader extends StatelessWidget {
  const StationLoader({super.key});

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
      child: const Row(
        children: [
          LazyLoader(width: 90, height: 90),
          Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LazyLoader(width: 100, height: 20),
                Gap(4),
                LazyLoader(width: 100, height: 20),
                Gap(4),
                LazyLoader(width: 100, height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
