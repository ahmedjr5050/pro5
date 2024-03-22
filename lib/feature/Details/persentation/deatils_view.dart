import 'package:flutter/material.dart';
import 'package:pro5/core/assets/imagesname/name.dart';
import 'package:pro5/feature/Details/persentation/widgets/details_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(String place, {
    super.key,
  });
  static String detailRoute = "/details";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 20,
          color: const Color(0xffDBC596),
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          autofocus: true,
          mini: true,
          backgroundColor: const Color(0xffA77A53),
          elevation: 30,
          onPressed: () {},
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home_outlined),
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color(0xffF5EED1),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFA77A53),
                Color(0xFFDBC596),
                Color(0xFF692D22),
              ],
              stops: [0.0, 0.067, 0.4967],
            ),
          ),
          child:  DetailsBody(
            NamePLACE.place
          ),
        ),
      ),
    );
  }
}
