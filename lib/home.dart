import 'package:flutter/material.dart';
import 'package:pro5/leisure.dart';
import 'package:pro5/widgets/custom_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.green[200],
              elevation: 0),
          backgroundColor: Colors.green[200],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomConatiner(
                      image: 'assets/Religious.jpg', text: 'Religious Tourism'),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ImagePickerDemo()),
                        );
                      },
                      child: const CustomConatiner(
                          image: 'assets/Cultual.jpg',
                          text: 'Cultural tourism')),
                  const CustomConatiner(
                      image: 'assets/Adventure.jpg', text: 'Leisure Tourism'),
                ],
              ),
            ),
          )),
    );
  }
}
