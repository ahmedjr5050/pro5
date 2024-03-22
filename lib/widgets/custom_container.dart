import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomConatiner extends StatelessWidget {
  final String image;
  final String text;

  CustomConatiner({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 4),
      transformAlignment: Alignment.bottomLeft,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red[100],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
