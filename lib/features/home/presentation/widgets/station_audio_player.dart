import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/features/features.dart';

class StationAudioPlayer extends StatelessWidget {
  const StationAudioPlayer({
    required this.station,
    required this.position,
    required this.duration,
    required this.playing,
    required this.onPlayTap,
    required this.onShare,
    this.isFavorite = false,
    super.key,
  });

  final StationEntity station;
  final Duration position;
  final Duration duration;
  final bool playing;
  final VoidCallback onShare;
  final VoidCallback onPlayTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            PhotoHolder(
              image: station.logo,
              width: 300,
              height: 300,
              borderRadius: 4,
            ),
            Gap(32),
            TextRegular(
              station.name,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            Gap(4),
            TextRegular(station.location?.locationText ?? '', fontSize: 14),
            Gap(4),
            TextRegular(
              station.languages.firstOrNull?.name ?? '',
              fontSize: 14,
            ),
          ],
        ),
        Spacer(),

        const Gap(32),
        SafeArea(
          child: Center(
            child: ControlCenter(
              station: station,
              onPlayTap: onPlayTap,
              onShare: onShare,
              playing: playing,
              isFavorite: isFavorite,
            ),
          ),
        ),
        const Gap(32),
      ],
    );
  }
}
