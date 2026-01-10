import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_style.dart';
import 'package:islami_app/features/data/models/onBoarding_model.dart';
import 'package:islami_app/features/home/home_view.dart';
import 'package:islami_app/features/introduction/presentation/widgets/all_onboarding_bodey_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'onBoarding';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  static int selectedIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                controller: controller,
                itemCount: OnBoardingModel.onBoarding.length,
                itemBuilder: (context, index) {
                  return AllOnBoardingBodyWidget(
                    image: OnBoardingModel.onBoarding[index].image,
                    text: OnBoardingModel.onBoarding[index].text,
                    supText: OnBoardingModel.onBoarding[index].supText,
                    supText2: OnBoardingModel.onBoarding[index].supText2,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.height * 0.033),
              child: SizedBox(
                height: context.height * 0.06,
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible: selectedIndex != 0,
                        child: TextButton(
                          onPressed: () {
                            controller.previousPage(
                              duration: Duration(milliseconds: 300),
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
                        children: [
                          DotRow(0),
                          DotRow(1),
                          DotRow(2),
                          DotRow(3),
                          DotRow(4),
                        ],
                      ),
                    ),
                    // Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Visibility(
                        visible: selectedIndex <= 4,
                        child: TextButton(
                          onPressed: () {
                            if (selectedIndex ==
                                OnBoardingModel.onBoarding.length - 1) {
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
                            selectedIndex <= 3 ? "Next" : "Finish",
                            style: TextStyle(
                              color: AppColors.goldColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
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

  // ignore: non_constant_identifier_names
  Widget DotRow(int index) {
    bool isSelected;
    if (selectedIndex == index) {
      isSelected = true;
    } else {
      isSelected = false;
    }
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
            borderRadius: isSelected
                ? BorderRadius.circular(16)
                : BorderRadius.circular(9999),
          ),
        ),
      ),
    );
  }
}
