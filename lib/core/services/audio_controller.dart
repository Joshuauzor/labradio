import 'package:audio_session/audio_session.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

// Manage the main audio player when background play, queue, playlist is needed
@lazySingleton
class AudioController {
  AudioController(this.audioPlayer);

  final AudioPlayer audioPlayer;

  Future<void> init({
    required AudioSource audioSource,
    int? initialIndex,
    Duration? initialPosition,
  }) async {
    // define the behaviour of the audio when an interuption occurs
    await (await AudioSession.instance).configure(
      const AudioSessionConfiguration.music(),
    );

    // initialize audio
    await audioPlayer.setAudioSource(
      audioSource,
      initialIndex: initialIndex,
      initialPosition: initialPosition,
    );
  }

  Future<void> play() async {
    await audioPlayer.play();
  }

  Future<void> pause() async {
    await audioPlayer.pause();
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }

  Future<void> destroy() async {
    await audioPlayer.stop();
    await audioPlayer.dispose();
  }

  Future<void> seek({required Duration duration}) async {
    await audioPlayer.seek(duration);
  }

  ///  seek to a new track, providing the [position] moves to the exact position of the [index]
  Future<void> seekTo({required int index, Duration? position}) async {
    await audioPlayer.seek(position ?? Duration.zero, index: index);
  }

  Future<void> loop({LoopMode? loopMode}) async {
    await audioPlayer.setLoopMode(loopMode ?? LoopMode.one);
  }

  Future<void> next() async {
    await audioPlayer.seekToNext();
  }

  Future<void> previous() async {
    await audioPlayer.play();
  }

  Future<void> setUrl({required String url}) async {
    await audioPlayer.setUrl(url);
  }

  // a getter than return the stream of the audio data
  Stream<RadioStreamData> get positionDataStream =>
      Rx.combineLatest6<
        Duration,
        Duration?,
        bool,
        int?,
        LoopMode,
        ProcessingState,
        RadioStreamData
      >(
        audioPlayer.positionStream,
        audioPlayer.durationStream,
        audioPlayer.playingStream,
        audioPlayer.currentIndexStream,
        audioPlayer.loopModeStream,
        audioPlayer.processingStateStream,
        (position, duration, playing, currentIndex, loopMode, processingState) {
          return RadioStreamData(
            position: position,
            duration: duration ?? Duration.zero,
            playing: playing,
            currentIndex: currentIndex,
            loopMode: loopMode,
            processingState: processingState,
          );
        },
      );
}

class RadioStreamData {
  RadioStreamData({
    required this.position,
    required this.duration,
    required this.playing,
    required this.currentIndex,
    required this.loopMode,
    required this.processingState,
  });

  final bool playing;
  final Duration position;
  final Duration duration;
  final int? currentIndex;
  final LoopMode loopMode;
  final ProcessingState processingState;
}
