import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro5/feature/Details/persentation/deatils_view.dart';
import 'package:pro5/feature/chatapp/screen/chatpage.dart';
import 'package:pro5/feature/closest_places/presentation/closest_places_view.dart';
import 'package:pro5/feature/detects_action/presentation/widgets/detectsView.dart';
import 'package:pro5/feature/home/homescreen.dart';
import 'package:pro5/feature/home/manage/cubit/cubit/weather_cubit.dart';
import 'package:pro5/feature/onboard/onboard.dart';
import 'package:pro5/feature/scan/getimages.dart';
import 'package:pro5/feature/signin/forget/passwordforget.dart';
import 'package:pro5/feature/signin/login_screen.dart';
import 'package:pro5/feature/signup/signup_screen.dart';
import 'package:pro5/feature/splash/splash_screen.dart';
import 'package:pro5/feature/tourism_type/presentation/toursim_type_view.dart';
import 'package:pro5/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherCubit(),
          ),
        ],
        child: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: const Size(360, 690),
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: {
                  '/': (context) => const HomeScreen(),
                  DetailsView.detailRoute: (context) => const DetailsView(
                        '',
                      ),
                  HomeScreen.homeRoute: (context) => const HomeScreen(),
                  TourismType.tourismTypeRoute: (context) =>
                      const TourismType(),
                  ClosesPLaces.colosesPlacess: (context) =>
                      const ClosesPLaces(),
                  ImagePickerDemo.imagepicker: (context) => ImagePickerDemo(),
                  DetectView.detectRoute: (context) => const DetectView(),
                  LoginScreen.loginRoute: (context) => const LoginScreen(),
                  OnBoard.onboardRoute: (context) => const OnBoard(),
                  SignUpScreen.signupRoute: (context) => const SignUpScreen(),
                  SplashScreen.splashRoute: (context) => const SplashScreen(),
                  Forget.forgetRoute: (context) => Forget(),
                  MapScreen.location: (context) => const MapScreen(),
                  ChatPage.routeName: (context) =>const  ChatPage(),
                },
              );
            }));
  }
}
