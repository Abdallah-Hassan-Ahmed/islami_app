import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/services/radio_services.dart';
import 'package:islami_app/features/data/models/radio_model.dart';

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

  // =====================
  // Audio Player
  // =====================
  final AudioPlayer _player = AudioPlayer();

  int? currentPlayingIndex; // الراديو اللي شغال فعليًا
  bool isPlaying = false;

  // Loading خاص بالصوت
  bool isAudioLoading = false;
  int? loadingIndex;

  // Mute خاص بالراديو الحالي فقط
  bool isMuted = false;
  int? mutedIndex;

  // =====================
  // Play / Pause Radio
  // =====================
  Future<void> playRadio(int index) async {
    try {
      // نفس الراديو شغال → Pause
      if (currentPlayingIndex == index && isPlaying) {
        await _player.pause();
        isPlaying = false;
        notifyListeners();
        return;
      }

      // 🔴 Reset mute عند تغيير الراديو
      isMuted = false;
      mutedIndex = null;
      await _player.setVolume(1.0);

      // ⏳ بدأ تحميل الصوت
      loadingIndex = index;
      isAudioLoading = true;
      notifyListeners();

      // إيقاف أي راديو شغال
      await _player.stop();

      // تشغيل الراديو الجديد
      await _player.play(
        UrlSource(radios[index].url),
      );

      currentPlayingIndex = index;
      isPlaying = true;

      // انتهى التحميل
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

  // =====================
  // Mute / Unmute
  // =====================
  Future<void> toggleMute(int index) async {
    // الميوت بس على الراديو اللي شغال
    if (currentPlayingIndex != index) return;

    isMuted = !isMuted;
    mutedIndex = isMuted ? index : null;

    await _player.setVolume(isMuted ? 0.0 : 1.0);
    notifyListeners();
  }

  // =====================
  // Dispose
  // =====================
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
