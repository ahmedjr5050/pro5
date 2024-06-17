// ignore_for_file: use_build_context_synchronously, avoid_print, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro5/core/helper/extention.dart';
import 'package:pro5/core/routing/routes.dart';

import 'package:pro5/feature/signin/manager/auth/authapp.dart';
import 'package:pro5/feature/signup/signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService auth = FirebaseAuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff672e22),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),
              _buildHeaderButtons(context),
              const SizedBox(height: 35),
              _buildLoginForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderButtons(BuildContext context) {
    return Stack(
      children: [
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
              backgroundColor: const Color(0xffffffff),
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
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.devicePixelRatioOf(context) / 2 * 80),
        _buildTextField(emailController, 'Enter Email'),
        SizedBox(height: 10.px),
        _buildTextField(passwordController, 'Enter Password',
            obscureText: true),
        _buildForgetPasswordButton(context),
        const SizedBox(height: 50),
        _buildLoginButton(context),
        const SizedBox(height: 50),
        const Text(
          'OR',
          style: TextStyle(
            color: Color(0xffDBC596),
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Capriola',
          ),
        ),
        const SizedBox(height: 50),
        _buildSocialLoginButtons(),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      {bool obscureText = false}) {
    return SizedBox(
      height: 50,
      width: 350,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.px),
            ),
          ),
          hintText: hintText,
          filled: true,
          hintStyle: const TextStyle(
            color: Color(0x4D000000),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Capriola',
          ),
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.forgetPassword);
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            'Forget Password ?',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xffDBC596),
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              fontFamily: 'Capriola',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _signin(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffdbc596),
        fixedSize: const Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          color: Color(0xff692d22),
          fontSize: 28.0,
          fontFamily: 'Koh',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('lib/core/assets/images/fb.png'),
        GestureDetector(
          onTap: () => _signInWithGoogle(context),
          child: Image.asset('lib/core/assets/images/google.png'),
        ),
        Image.asset('lib/core/assets/images/insta.png'),
      ],
    );
  }

  Future<void> _signin(BuildContext context) async {
    try {
      String email = emailController.text;
      String password = passwordController.text;
      User? user = await auth.signin(email, password);

      if (user != null) {
        context.pushReplacementNamed(Routes.homeScreen);
      } else {
        _showSnackBar(context, 'Login Failed');
      }
    } catch (error) {
      print("Error signing in: $error");
      _showSnackBar(context, 'Login Failed: $error');
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        _showSnackBar(context, 'Google sign-in aborted');
        return; // The user aborted the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        context.pushReplacementNamed(Routes.homeScreen);
      }
    } catch (error) {
      print("Error signing in with Google: $error");

      String errorMessage = 'Unknown error occurred';
      if (error is PlatformException) {
        errorMessage = error.message ?? 'Platform exception occurred';
      } else if (error is FirebaseAuthException) {
        errorMessage = error.message ?? 'Firebase auth exception occurred';
      }

      _showSnackBar(context, errorMessage);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Color.fromARGB(255, 231, 113, 92),
            fontSize: 10.0,
            fontFamily: 'Koh',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
