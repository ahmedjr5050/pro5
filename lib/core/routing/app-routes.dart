// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:pro5/core/routing/routes.dart';
import 'package:pro5/feature/Details/persentation/deatils_view.dart';
import 'package:pro5/feature/chatapp/screen/chatpage.dart';
import 'package:pro5/feature/closest_places/presentation/closest_places_view.dart';
import 'package:pro5/feature/detects_action/presentation/widgets/detectsView.dart';
import 'package:pro5/feature/home/homescreen.dart';
import 'package:pro5/feature/onboard/onboard.dart';
import 'package:pro5/feature/scan/getimages.dart';
import 'package:pro5/feature/signin/forget/passwordforget.dart';
import 'package:pro5/feature/signin/login_screen.dart';
import 'package:pro5/feature/signup/signup_screen.dart';
import 'package:pro5/feature/splash/splash_screen.dart';
import 'package:pro5/feature/tourism_type/presentation/toursim_type_view.dart';
import 'package:pro5/location.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments is used to pass data from one screen to another
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoard(
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.imagePickerDemo:
        return MaterialPageRoute(
          builder: (_) =>  ImagePickerDemo(),
        );
      case Routes.detailsView:
        return MaterialPageRoute(
          builder: (_) =>  const DetailsView(
            '',
          ),
        );
      case Routes.detectView:
        return MaterialPageRoute(
          builder: (_) => const DetectView(),
        );
      case Routes.closestPlacesView:
        return MaterialPageRoute(
          builder: (_) => const ClosesPLaces(),
        );
      case Routes.tourimTypeView:
        return MaterialPageRoute(
          builder: (_) => const TourismType(),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) =>  Forget(),
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatPage(),
        );
      case Routes.locationScreen:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}