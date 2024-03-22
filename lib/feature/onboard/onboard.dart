import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pro5/feature/signin/login_screen.dart';
import 'package:pro5/feature/signup/signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});
  static const onboardRoute = '/onboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff672E22),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/core/assets/images/logo.png',
              height: 250,
              width: 250,
            ),
            Animate(
                effects: [
                  SlideEffect(duration: 2.seconds),
                  BoxShadowEffect(
                    begin: BoxShadowEffect.neutralValue,
                    curve: Curves.bounceIn,
                    duration: 2.seconds,
                  ),
                  // FadeEffect(duration: 2.seconds),
                  // ScaleEffect(duration: 500.ms),
                  // MoveEffect(duration: 1000.ms),
                ],
                child: Text(
                  'HORUS GUIDE',
                  style: TextStyle(
                    color: const Color(0xffDEDEDE),
                    fontSize: 40.0.px,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Koh',
                  ),
                )),
            SizedBox(
              height: 20.px,
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.signupRoute);
                },
                color: const Color(0xffDBC596),
                height: 55.px,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: const Color(
                        0xff692D22,
                      ),
                      fontFamily: 'Koh',
                      fontSize: 24.px,
                      fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: 20.px,
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.loginRoute);
                },
                color: const Color(0xffDBC596),
                height: 55.px,
                minWidth: 120.px,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: const Color(
                        0xff692D22,
                      ),
                      fontFamily: 'Koh',
                      fontSize: 24.px,
                      fontWeight: FontWeight.w700),
                ))
          ],
        ),
      ),
    );
  }
}
