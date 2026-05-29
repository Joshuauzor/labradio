import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

class ControlCenter extends StatelessWidget {
  const ControlCenter({
    required this.station,
    required this.onPlayTap,
    required this.onShare,
    this.playing = false,
    this.isFavorite = false,
    super.key,
  });

  final StationEntity station;
  final bool playing;
  final bool isFavorite;
  final VoidCallback onPlayTap;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // control buttons
          CircularButton(
            onTap: onPlayTap,
            icon: playing ? AppAssets.pause : AppAssets.play,
          ),
          const Gap(43),
        ],
      ),
    );
  }
}
