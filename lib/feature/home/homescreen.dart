// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro5/feature/Details/persentation/deatils_view.dart';
import 'package:pro5/feature/home/manage/cubit/cubit/weather_cubit.dart';
import 'package:pro5/feature/tourism_type/presentation/toursim_type_view.dart';
import 'package:pro5/location.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String homeRoute = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<WeatherCubit>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffDBC596), Color(0xff692D22)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 49.px,
                    width: 360.px,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.px),
                          ),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: EdgeInsets.all(10.px),
                        prefixIconColor: const Color(0xffd2b98d),
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Color(0xff692D22),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Koh'),
                        fillColor: const Color(0xff692D22),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.px,
                  ),
                  weatherContainer(),
                  SizedBox(
                    height: 8.px,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              TourismType.tourismTypeRoute,
                              (route) {
                                return false;
                              },
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(125, 255, 255, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                      'lib/core/assets/images/tourismTypes.png'),
                                  const Spacer(),
                                  const Text(
                                    'Tourism  types',
                                    style: TextStyle(
                                      fontFamily: 'KohSantepheap',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(125, 255, 255, 255),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                    'lib/core/assets/images/tourismPlaces.png'),
                                const Spacer(),
                                const Text(
                                  'Tourism Places',
                                  style: TextStyle(
                                    fontFamily: 'KohSantepheap',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(125, 255, 255, 255),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                    'lib/core/assets/images/camera.png'),
                                const Spacer(),
                                const Text(
                                  'Camera',
                                  style: TextStyle(
                                    fontFamily: 'KohSantepheap',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(125, 255, 255, 255),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('lib/core/assets/images/car.png'),
                                const Spacer(),
                                const Text(
                                  'Driver',
                                  style: TextStyle(
                                    fontFamily: 'KohSantepheap',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(125, 255, 255, 255),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, DetailsView.detailRoute);
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        MapScreen.location,
                                      );
                                    },
                                    child: Hero(
                                      tag: 'location_hero_tag',
                                      child: Image.asset(
                                          'lib/core/assets/images/location.png'),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  'Locaton',
                                  style: TextStyle(
                                    fontFamily: 'KohSantepheap',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(125, 255, 255, 255),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('lib/core/assets/images/ai.png'),
                                const Spacer(),
                                const Text(
                                  'AI Assistant',
                                  style: TextStyle(
                                    fontFamily: 'KohSantepheap',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 150,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(125, 255, 255, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                      'lib/core/assets/images/profile.png'),
                                  const Spacer(),
                                  const Text(
                                    'Your Profile',
                                    style: TextStyle(
                                      fontFamily: 'KohSantepheap',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(125, 255, 255, 255),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                    'lib/core/assets/images/savedPlaces.png'),
                                const Spacer(),
                                const Text(
                                  'Saved Places',
                                  style: TextStyle(
                                    fontFamily: 'KohSantepheap',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget weatherContainer() {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        final x = state.weatherModels.current;
        int? temp = x?.uv!.toInt();
        print('is a $temp');
        return Container(
          height: 108,
          width: 399,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.px),
              color: const Color.fromRGBO(245, 238, 209, 0.50)),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.px, top: 15.px),
                child: Column(children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: ' ${x!.lastUpdated.toString()} \n ',
                        style: TextStyle(
                            fontFamily: 'Koh',
                            fontWeight: FontWeight.w700,
                            fontSize: 15.px,
                            color: const Color(0xffFFFFFF))),
                    TextSpan(
                        text: '   Weather Today:\n ',
                        style: TextStyle(
                            fontFamily: 'Koh',
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(105, 45, 34, 1),
                            fontSize: 15.px)),
                    TextSpan(
                        text: '            ${x.condition!.text}',
                        style: TextStyle(
                          fontFamily: 'Koh',
                          fontSize: 16.px,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ))
                  ]))
                ]),
              ),
              const SizedBox(
                width: 100,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.px, top: 30),
                child: Text('${x.tempC}°C',
                    style: TextStyle(fontSize: 18.px, color: Colors.white)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40, left: 5),
                  child: Image.network('https:${x.condition!.icon}',
                      fit: BoxFit.cover, height: 60.px, width: 60.px),
                ),
              ),
            ],
          ),
        );
      } else if (state is WeatherError) {
        print('error: ${state.error.toString()}');
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
