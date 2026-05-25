import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _flutterTts = FlutterTts();
  final Completer<void> _initCompleter = Completer<void>();
  final ValueNotifier<bool> isSpeaking = ValueNotifier<bool>(false);

  TtsService() {
    _initTts();
  }

  Future<void> _initTts() async {
    _flutterTts.setStartHandler(() {
      print("TTS: Started speaking");
      isSpeaking.value = true;
    });

    _flutterTts.setCompletionHandler(() {
      print("TTS: Finished speaking");
      isSpeaking.value = false;
    });

    _flutterTts.setErrorHandler((msg) {
      print("TTS: Error - $msg");
      isSpeaking.value = false;
    });

    try {
      List<dynamic>? engines = await _flutterTts.getEngines;
      print("TTS: Available engines: $engines");
      
      if (engines != null && engines.contains("com.google.android.tts")) {
        await _flutterTts.setEngine("com.google.android.tts");
        print("TTS: Set engine to com.google.android.tts");
      }
    } catch (e) {
      print("TTS: Error getting engines: $e");
    }

    bool isLanguageAvailable = await _flutterTts.isLanguageAvailable("ar");
    print("TTS: Is Arabic available? $isLanguageAvailable");
    
    await _flutterTts.setLanguage("ar");
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);
    
    await _flutterTts.awaitSpeakCompletion(true);
    _initCompleter.complete();
    print("TTS: Initialization complete");
  }

  Future<void> speak(String text) async {
    // Wait for initialization to finish if it hasn't already
    if (!_initCompleter.isCompleted) {
      print("TTS: Waiting for initialization before speaking...");
      await _initCompleter.future;
    }

    if (text.isNotEmpty) {
      print("TTS: Attempting to speak: $text");
      await _flutterTts.speak(text);
    } else {
      print("TTS: Warning - text is empty");
    }
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}
