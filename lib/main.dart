import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notes/viewer/screens/AddNotesPage.dart';
import 'package:firebase_notes/viewer/screens/HomePage.dart';
import 'package:firebase_notes/viewer/screens/SignInPage.dart';
import 'package:firebase_notes/viewer/screens/SignUpPage.dart';
import 'package:firebase_notes/viewer/screens/SplashPage.dart';
import 'package:firebase_notes/viewer/screens/WelcomePage.dart';
import 'package:firebase_notes/viewer/screens/editNotePage.dart';
import 'package:firebase_notes/viewer/screens/launuagePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool? isLogged = preferences.getBool('isLogged') ?? false;
  bool? isCreate = preferences.getBool('isSignup') ?? false;
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple.shade900,
            secondary: Colors.purple.shade900)),
    initialRoute: (isCreate == false)
        ? 'splash'
        : (isLogged == false)
            ? 'signIn'
            : '/',
    routes: {
      'addNotePage': (context) => const AddNotePage(),
      'editNotePage': (context) => const EditNotePage(),
      '/': (context) => const HomePage(),
      'language': (context) => const LanguagePage(),
      'signIn': (context) => SignInPage(
            prefs: preferences,
          ),
      'signUp': (context) => const SignUpPage(),
      'splash': (context) => const SplashPage(),
      'welcome': (context) => const WelcomePage(),
    },
  ));
}
