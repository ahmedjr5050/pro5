import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro5/core/routing/app-routes.dart';
import 'package:pro5/horus.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Horus(
    appRouter: AppRouter(),
  ));
}