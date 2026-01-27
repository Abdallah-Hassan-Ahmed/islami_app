import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_style.dart';
import 'package:islami_app/features/data/models/onBoarding_model.dart';
import 'package:islami_app/features/home/home_view.dart';
import 'package:islami_app/features/introduction/presentation/widgets/all_onboarding_bodey_widget.dart';
import 'package:islami_app/features/introduction/presentation/widgets/shared_pref_helper.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'onBoarding';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectedIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// الصفحات
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: OnBoardingModel.onBoarding.length,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = OnBoardingModel.onBoarding[index];
                  return AllOnBoardingBodyWidget(
                    image: item.image,
                    text: item.text,
                    supText: item.supText,
                    supText2: item.supText2,
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: context.height * 0.03),
              child: SizedBox(
                height: context.height * 0.06,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// Back
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible: selectedIndex != 0,
                        child: TextButton(
                          onPressed: () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "Back",
                            style: AppStyle.bold16White.copyWith(
                              color: AppColors.goldColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          OnBoardingModel.onBoarding.length,
                          (index) => _dotItem(index),
                        ),
                      ),
                    ),

                    /// Next / Finish
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          if (selectedIndex ==
                              OnBoardingModel.onBoarding.length - 1) {
                            await SharedPrefHelper.setOnBoardingSeen();

                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeView.routeName,
                              (route) => false,
                            );
                          } else {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          selectedIndex ==
                                  OnBoardingModel.onBoarding.length - 1
                              ? "Finish"
                              : "Next",
                          style: TextStyle(
                            color: AppColors.goldColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget للنقطة
  Widget _dotItem(int index) {
    final bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          height: 7,
          width: isSelected ? 18 : 7,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.goldColor : AppColors.grayColor,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }
}
