import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

class RadioPlayerCubit extends Cubit<RadioPlayerState> {
  RadioPlayerCubit({required this.audioController, required this.analytics})
    : super(const RadioPlayerState.initial());

  final AudioController audioController;
  final GoogleAnalytics analytics;
  final translate = LocalizationService.instance!;

  Stream<RadioStreamData> get positionDataStream =>
      audioController.positionDataStream;

  StationEntity? _station;
  StationEntity? get station => _station;

  // initialize music player engine
  Future<void> initialize({required StationEntity station}) async {
    emit(const RadioPlayerState.loading());
    final isPlaying = audioController.audioPlayer.playing;
    // ensure not to play the same station again
    if (_station != station || !isPlaying) {
      _station = station;
      print('initialize');
      final audioSource = AudioSource.uri(
        Uri.parse(station.streams.firstOrNull?.url ?? ''),
      );
      // initialize audio engine
      unawaited(audioController.init(audioSource: audioSource));
    }
  }

  // play music
  Future<void> play() async {
    // sync music played for recommendation
    await audioController.play();
  }

  // pause music
  Future<void> pause() async {
    await audioController.pause();
  }

  Future<void> loop({LoopMode? loopMode}) async {
    await audioController.loop(loopMode: loopMode);
  }

  /// seek use to adjust position of player [duration] always in milliseconds
  Future<void> seek(Duration duration) async {
    // prevent seek debounce
    Future.delayed(const Duration(milliseconds: 200), () async {
      await audioController.seek(duration: duration);
    });
  }

  // start audio stream
  Future<void> streamAudio({required StationEntity station}) async {
    await initialize(station: station);
    // play music
    await play();
  }

  // dispose all streams and prevent memory leak
  @override
  Future<void> close() {
    audioController.destroy();
    return super.close();
  }
}
