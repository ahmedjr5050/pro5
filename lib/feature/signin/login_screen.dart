// ignore_for_file: use_build_context_synchronously, avoid_print, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro5/feature/home/homescreen.dart';
import 'package:pro5/feature/signin/forget/passwordforget.dart';
import 'package:pro5/feature/signin/manager/auth/authapp.dart';
import 'package:pro5/feature/signup/signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const loginRoute = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff672e22),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Stack(
                children: [
                  // login & Sign up
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        // ignore: use_full_hex_values_for_flutter_colors
                        backgroundColor: const Color(0xffffffffff),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: 'BalsamiqSans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffdbc596),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xff6A2F21),
                          fontSize: 18.0,
                          fontFamily: 'BalsamiqSans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.devicePixelRatioOf(context) / 2 * 80,
                  ),
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextFormField(
                      cursorHeight: 20,
                      controller: email,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.px),
                          ),
                        ),
                        hintText: 'Enter Email',
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
                    height: 50,
                    width: 350,
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, Forget.forgetRoute)
                          },
                          child: const Text(
                            'Forget Password ?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Color(0xffDBC596),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                fontFamily: 'Capriola'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      signin(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffdbc596),
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    child: const Text(
                      'Login',
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
                      fontFamily: 'Capriola',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('lib/core/assets/images/fb.png'),
                      GestureDetector(
                          onTap: () async{
                          await  signInWithGoogle(
                            context
                          );
                            // );
                          },
                          child:
                              Image.asset('lib/core/assets/images/google.png')),
                      Image.asset('lib/core/assets/images/insta.png'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signin(BuildContext context) async {
    String email = this.email.text;
    String password = this.password.text;
    User? user = await auth.signin(email, password);
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
          fontFamily: 'Koh',
          fontWeight: FontWeight.w700,
        ),
      )));
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, sign in with Firebase Authentication
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Navigate to the homepage if authentication is successful
    if (userCredential.user != null) {
      Navigator.pushNamed(context, HomeScreen.homeRoute);
    }
  } catch (error) {
    print("Error signing in with Google: $error");
    // Handle error appropriately, such as showing a snackbar or dialog
  }
}
}
