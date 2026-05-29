import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labradio/features/features.dart';

class StationListLoader extends StatelessWidget {
  const StationListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Gap(10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (context, index) => const StationLoader(),
    );
  }
}
