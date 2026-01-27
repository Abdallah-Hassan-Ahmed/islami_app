import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/features/home/home_view.dart';
import 'package:islami_app/features/introduction/presentation/view/on_boarding_view.dart';
import 'package:islami_app/features/introduction/presentation/widgets/shared_pref_helper.dart';
import 'package:islami_app/features/splash/Presentation/widgets/mosue01_widget.dart';
import 'package:islami_app/features/splash/Presentation/widgets/shape_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<double> _logoFadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _logoFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final seen = await SharedPrefHelper.isOnBoardingSeen();

    Navigator.pushNamedAndRemoveUntil(
      context,
      seen ? HomeView.routeName : OnBoardingView.routeName,
      (route) => false, 
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            /// Background
            Image.asset(
              AppImages.background,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),

            /// Mosque
            const Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Mosqe01Widget(),
            ),

            /// Glow
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                height: 313,
                width: 88,
                child: Image.asset(AppImages.glow),
              ),
            ),

            /// Shapes
            Positioned(
              top: 170,
              left: 0,
              child: ShapeWidget(images: AppImages.shape07),
            ),
            Positioned(
              bottom: 60,
              right: 0,
              child: ShapeWidget(images: AppImages.shape04),
            ),

            /// Animated Logo
            Align(
              alignment: Alignment.center,
              child: FadeTransition(
                opacity: _logoFadeAnimation,
                child: SlideTransition(
                  position: _logoSlideAnimation,
                  child: SizedBox(
                    height: 230,
                    width: 150,
                    child: Image.asset(AppImages.islamiLogo),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
