import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class MeditationSessionScreen extends StatefulWidget {
  final int sessionNum;

  const MeditationSessionScreen({super.key, required this.sessionNum});

  @override
  State<MeditationSessionScreen> createState() =>
      _MeditationSessionScreenState();
}

class _MeditationSessionScreenState extends State<MeditationSessionScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int totalSeconds = 300; // 5 minutes default
  int remainingSeconds = 300;
  Timer? _timer;

  @override
  void dispose() {
    _audioPlayer.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        _stopAudio();
      }
    });
  }

  void _playAudio() async {
    await _audioPlayer.play(AssetSource('audio/session${widget.sessionNum}.mp3'));
    setState(() {
      isPlaying = true;
    });
    _startTimer();
  }

  void _pauseAudio() async {
    await _audioPlayer.pause();
    _timer?.cancel();
    setState(() {
      isPlaying = false;
    });
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
    _timer?.cancel();
    setState(() {
      isPlaying = false;
      remainingSeconds = totalSeconds;
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueLightColor,
        elevation: 0,
        title: Text("Session ${widget.sessionNum}"),
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/Meditation_women_small.svg",
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              "Meditation Session ${widget.sessionNum}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Relax your mind and body with this guided meditation session. Duration: 5 minutes.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              _formatTime(remainingSeconds),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  label: Text(isPlaying ? "Pause" : "Play"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlueColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                  ),
                  onPressed: () {
                    if (isPlaying) {
                      _pauseAudio();
                    } else {
                      _playAudio();
                    }
                  },
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.stop),
                  label: const Text("Stop"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                  ),
                  onPressed: _stopAudio,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
