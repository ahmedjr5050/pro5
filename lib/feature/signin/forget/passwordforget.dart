// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class Forget extends StatelessWidget {
  Forget({super.key});
  static const forgetRoute = '/forget';
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff672e22),
      appBar: AppBar(
        title: const Text('Forget Password'),
        backgroundColor: const Color(0xffdbc596),
      ),
      body: Column(children: [
        SizedBox(
          height: 200.px,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: emailcontroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(color: Color(0xffdbc596)),
                gapPadding: 10,
              ),
              hintText: 'Enter Email',
              filled: true,
              hintStyle: TextStyle(
                  color: Color(0x4D000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Koh'),
              fillColor: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 50.px,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffdbc596),
            fixedSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            forget(context);
          },
          child: const Text('Send',
              style: TextStyle(
                color: Color(0xff6A2F21),
                fontSize: 20,
                fontFamily: 'Koh',
              )),
        ),
      ]),
    );
  }

  Future<void> forget(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link sent successfully.'),
        ),
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'User did not sign up correctly') {
        errorMessage =
            'No user found with this email address. Please sign up first.';
                  ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No user found with this email address. Please sign up first'),
        ),
      );
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email format.';
      } else {
        errorMessage = e.message ?? 'An error occurred.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('An unexpected error occurred. Please try again later.'),
        ),
      );
    }
  }
}
