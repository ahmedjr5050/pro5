import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pro5/feature/onboard/onboard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
static const splashRoute = '/splash';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        centered: true,
        curve: Curves.easeOut,
        animationDuration: const Duration(milliseconds: 2000),
        backgroundColor: const Color(0xffDBC596),
        splash: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                'lib/core/assets/images/logo.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: AnimateList(
                    interval: 800.ms,
                    effects: [SlideEffect(duration: 800.ms)],
                    children: [
                       Text("HORUS ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Koh',
                              fontSize: 40.px,
                              color: const Color(0xff7B1E00)),
                              ),
                       Text(
                        "GUIDE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Koh',
                            fontSize: 40.px,
                            color: const Color(0xff7B1E00),
                            ),
                      )
                    ],
                  ))
            ],
          ),
        ),
        nextScreen: const OnBoard(),
        splashIconSize: 450,
        duration: 3000,
      ),
    );
  }
}
