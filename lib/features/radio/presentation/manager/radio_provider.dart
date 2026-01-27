import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/features/radio/data/radio_services.dart';
import 'package:islami_app/features/radio/data/model/radio_model.dart';

class RadioModelProvider extends ChangeNotifier {

  final RadioServices _service = RadioServices();

  bool isLoading = false;
  String? errorMessage;
  List<RadioModel> radios = [];

  Future<void> getRadio() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      radios = await _service.getRadioData();
    } catch (e) {
      errorMessage = 'حدث خطأ أثناء تحميل الإذاعات';
    }

    isLoading = false;
    notifyListeners();
  }


  final AudioPlayer _player = AudioPlayer();

  int? currentPlayingIndex; 
  bool isPlaying = false;

  bool isAudioLoading = false;
  int? loadingIndex;

  bool isMuted = false;
  int? mutedIndex;


  Future<void> playRadio(int index) async {
    try {
      if (currentPlayingIndex == index && isPlaying) {
        await _player.pause();
        isPlaying = false;
        notifyListeners();
        return;
      }

      isMuted = false;
      mutedIndex = null;
      await _player.setVolume(1.0);

      loadingIndex = index;
      isAudioLoading = true;
      notifyListeners();

      await _player.stop();

      await _player.play(
        UrlSource(radios[index].url),
      );

      currentPlayingIndex = index;
      isPlaying = true;

      isAudioLoading = false;
      loadingIndex = null;

      notifyListeners();
    } catch (e) {
      isAudioLoading = false;
      loadingIndex = null;
      notifyListeners();
      debugPrint('Audio error: $e');
    }
  }


  Future<void> toggleMute(int index) async {
    if (currentPlayingIndex != index) return;

    isMuted = !isMuted;
    mutedIndex = isMuted ? index : null;

    await _player.setVolume(isMuted ? 0.0 : 1.0);
    notifyListeners();
  }


  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
