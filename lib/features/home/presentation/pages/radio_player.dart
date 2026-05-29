import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({required this.params, super.key});

  final RadioPlayerParams params;

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  @override
  void initState() {
    Future.delayed(Duration.zero, _initialize);
    Future.delayed(Duration.zero, _setLogs);
    super.initState();
  }

  Future<void> _initialize() async {
    final musicCubit = BlocProvider.of<RadioPlayerCubit>(context);
    if (widget.params.fullPlayer) {
      await musicCubit.streamAudio(station: widget.params.station);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Set logs for Analytics
  Future<void> _setLogs() async {
    // unawaited(GoogleAnalytics().logScreenView(screenName: SCREENS.player));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: const CustomBackButton(),
              ),
              Gap(42),
              Expanded(
                child: StreamBuilder<RadioStreamData>(
                  stream: context.read<RadioPlayerCubit>().positionDataStream,
                  builder: (context, snapshot) {
                    return StationAudioPlayer(
                      station: widget.params.station,
                      duration: snapshot.data?.duration ?? Duration.zero,
                      position: snapshot.data?.position ?? Duration.zero,
                      isFavorite: widget.params.station.isFavorite ?? false,
                      playing: snapshot.data?.playing ?? true,
                      onPlayTap: snapshot.data?.playing ?? true
                          ? context.read<RadioPlayerCubit>().pause
                          : context.read<RadioPlayerCubit>().play,
                      onShare: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioPlayerParams {
  RadioPlayerParams({required this.station, this.fullPlayer = true});

  final StationEntity station;

  /// whether to show the full player or not
  final bool fullPlayer;
}
