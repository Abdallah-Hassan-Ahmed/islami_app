import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/providers/radio_provider.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';
import '../../../data/models/radio_model.dart';

class RadioContainer extends StatelessWidget {
  final RadioModel radio;
  final int index;

  const RadioContainer({super.key, required this.radio, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Consumer<RadioModelProvider>(
            builder: (context, provider, _) {
              final bool isCurrentPlaying =
                  provider.currentPlayingIndex == index && provider.isPlaying;

              return Align(
                alignment: Alignment.bottomCenter,
                child: isCurrentPlaying
                    ? backgroundPlayImage()
                    : Image.asset(AppImages.mosque02, width: double.infinity),
              );
            },
          ),

          
          Padding(
            padding: EdgeInsets.only(top: context.height * 0.02),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                radio.name,
                style: AppStyle.bold18Black,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: context.height * 0.055),
            child: Align(
              alignment: Alignment.center,
              child: Consumer<RadioModelProvider>(
                builder: (context, provider, _) {
                  final isCurrent = provider.currentPlayingIndex == index;

                  if (provider.isAudioLoading &&
                      provider.loadingIndex == index) {
                    return SizedBox(
                      width: context.width * 0.06,
                      height: context.width * 0.06,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.black,
                      ),
                    );
                  }

                  return GestureDetector(
                    onTap: () {
                      provider.playRadio(index);
                    },
                    child: Image.asset(
                      isCurrent && provider.isPlaying
                          ? AppImages.pause
                          : AppImages.runAudio,
                      width: context.height * 0.035,
                    ),
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: context.height * 0.2,
              top: context.height * 0.055,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Consumer<RadioModelProvider>(
                builder: (context, provider, _) {
                  final isMutedForThisItem =
                      provider.mutedIndex == index && provider.isMuted;

                  return GestureDetector(
                    onTap: () {
                      provider.toggleMute(index);
                    },
                    child: Image.asset(
                      isMutedForThisItem
                          ? AppImages.volumeCross
                          : AppImages.volumeHight,
                      width: context.height * 0.04,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget backgroundPlayImage() {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.6,
        child: Image.asset(
          AppImages.runAudioBG,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
