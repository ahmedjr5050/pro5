import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro5/core/routing/app-routes.dart';
import 'package:pro5/core/routing/routes.dart';
import 'package:pro5/feature/home/manage/cubit/cubit/weather_cubit.dart';
import 'package:pro5/feature/scan/manage/cubit/cubit/detectimages_cubit.dart';

class Horus extends StatelessWidget {
  final AppRouter appRouter;
  const Horus({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DetectimagesCubit(),
          ),
          BlocProvider(
            create: (context) => WeatherCubit(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
              ),
              initialRoute: Routes.onBoardingScreen,
              onGenerateRoute: appRouter.generateRoute,
            )));
  }
}
