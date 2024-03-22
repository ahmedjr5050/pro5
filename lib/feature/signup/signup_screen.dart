// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:pro5/feature/home/homescreen.dart';
import 'package:pro5/feature/signin/login_screen.dart';
import 'package:pro5/feature/signin/manager/auth/authapp.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const signupRoute = '/signup';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController lastname = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    lastname.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff672e22),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                // login & Sign up
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'Koh',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffdbc596),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xff6A2F21),
                          fontSize: 18.0,
                          fontFamily: 'Koh',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              height: MediaQuery.devicePixelRatioOf(context) / 2 * 20,
            ),
            SizedBox(
              width: 350.0,
              height: 50.0,
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.px),
                    ),
                  ),
                  hintText: 'Enter First Name',
                  filled: true,
                  contentPadding: const EdgeInsets.all(16.0),
                  hintStyle: const TextStyle(
                      color: Color(0x4D000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Capriola'),
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.px,
            ),
            SizedBox(
              width: 350.0,
              height: 50.0,
              child: TextFormField(
                controller: lastname,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.px),
                    ),
                  ),
                  hintText: 'Enter Last Name',
                  filled: true,
                  hintStyle: const TextStyle(
                      color: Color(0x4D000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Capriola'),
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.px,
            ),
            SizedBox(
              width: 350.0,
              height: 50.0,
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.px),
                    ),
                  ),
                  hintText: 'Enter Email ',
                  contentPadding: const EdgeInsets.all(16.0),
                  filled: true,
                  hintStyle: const TextStyle(
                      color: Color(0x4D000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Capriola'),
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.px,
            ),
            SizedBox(
              width: 350.0,
              height: 50.0,
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.px),
                    ),
                  ),
                  hintText: 'Enter Password',
                  filled: true,
                  hintStyle: const TextStyle(
                      color: Color(0x4D000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Capriola'),
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.px,
            ),
            SizedBox(
              width: 350.0,
              height: 50.0,
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.px),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16.0),
                  hintText: 'Enter Phone Number',
                  filled: true,
                  hintStyle: const TextStyle(
                      color: Color(0x4D000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Capriola'),
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                signup(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffdbc596),
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xff692d22),
                  fontSize: 28.0,
                  fontFamily: 'Koh',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'OR',
              style: TextStyle(
                color: Color(0xffDBC596),
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Koh',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('lib/core/assets/images/fb.png'),
                Image.asset('lib/core/assets/images/google.png'),
                Image.asset('lib/core/assets/images/insta.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signup(BuildContext context) async {
    String email = emailcontroller.text;
    String password = this.password.text;
    String name = this.name.text;
    String lastname = this.lastname.text;
    String phone = this.phone.text;

    User? user = await auth.signup(email, password, name, lastname, phone);
    if (user != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Login Failed',
        style: TextStyle(
          color: Color.fromARGB(255, 231, 113, 92),
          fontSize: 18.0,
          fontFamily: 'BalsamiqSans',
          fontWeight: FontWeight.w700,
        ),
      )));
    }
  }
}
