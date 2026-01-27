import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';

import 'package:islami_app/core/providers/time_provider.dart';
import 'package:islami_app/features/data/models/pray_time_model.dart';
import 'package:islami_app/features/home/time/widget/slider_widgrt.dart';

List<Map<String, String>> buildPrayItems(PrayTime t) {
  String period(String time) {
    final hour = int.parse(time.split(':')[0]);
    return hour >= 12 ? 'pm' : 'am';
  }

  return [
    {'name': 'fajr', 'time': t.fajr, 'period': period(t.fajr)},
    {'name': 'dhuhr', 'time': t.dhuhr, 'period': period(t.dhuhr)},
    {'name': 'asr', 'time': t.asr, 'period': period(t.asr)},
    {'name': 'maghrib', 'time': t.maghrib, 'period': period(t.maghrib)},
    {'name': 'isha', 'time': t.isha, 'period': period(t.isha)},
  ];
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.brawnColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.timeBG, fit: BoxFit.fill),
          ),

          // title
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: context.height * 0.01),
              child: Text(
                "Pray Time",
                style: AppStyle.bold20Black.copyWith(
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: context.height * 0.06),
              child: Consumer<TimeProvider>(
                builder: (context, provider, _) {
                  if (provider.prayDate == null) return const SizedBox();

                  return Text(
                    provider.gregorianWeekday,
                    style: AppStyle.bold20Black.copyWith(
                      color: AppColors.blackColor.withOpacity(0.7),
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
            top: context.width * 0.015,
            left: context.width * 0.055,
            child: Consumer<TimeProvider>(
              builder: (context, provider, _) {
                if (provider.prayDate == null) return const SizedBox();

                final d = provider.prayDate!;
                return Text(
                  "${d.gregorianDay} ${d.gregorianMonth},\n${d.gregorianYear}",
                  style: AppStyle.bold16WhiteJN.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.9),
                  ),
                );
              },
            ),
          ),

          Positioned(
            top: context.width * 0.015,
            right: context.width * 0.055,
            child: Consumer<TimeProvider>(
              builder: (context, provider, _) {
                if (provider.prayDate == null) return const SizedBox();

                final d = provider.prayDate!;
                return Text(
                  "${d.hijriDay} ${d.hijriMonth},\n${d.hijriYear}",
                  textAlign: TextAlign.end,
                  style: AppStyle.bold16WhiteJN.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.9),
                  ),
                );
              },
            ),
          ),

          // slider + next pray
          Positioned(
            bottom: context.width * 0.04,
            right: 0,
            left: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<TimeProvider>(
                  builder: (context, provider, _) {
                    if (provider.isLoading || provider.prayTime == null) {
                      return SizedBox(
                        height: 60,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.goldColor,
                          ),
                        ),
                      );
                    }

                    final items = buildPrayItems(provider.prayTime!);
                    return SliderWidget(items: items);
                  },
                ),
                SizedBox(height: context.height * 0.02),
                Consumer<TimeProvider>(
                  builder: (context, provider, _) {
                    return Text(
                      provider.nextPrayName == null
                          ? 'Next Pray --:--'
                          : 'Next Pray - ${provider.nextPrayName} (${provider.formattedNextPrayTime})',
                      style: AppStyle.bold16BlackJJ.copyWith(
                        color: AppColors.blackColor.withOpacity(0.8),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
