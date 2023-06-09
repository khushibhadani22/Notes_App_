import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  checkPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool done = prefs.getBool('welcome') ?? false;
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacementNamed(done == true ? '/' : 'welcome');
    });
  }

  @override
  void initState() {
    super.initState();
    checkPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 250,
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, val, widget) {
                  return Transform.scale(
                    scale: val,
                    child: widget,
                  );
                },
                child: Image.asset(
                  'assets/image/noteslogo.png',
                ),
              ),
              Text(
                "NOTE",
                style: TextStyle(
                    color: Colors.purple.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 270,
              ),
              Text(
                "Set up for first use",
                style: TextStyle(color: Colors.green.shade900, fontSize: 20),
              ),
              LinearProgressIndicator(
                minHeight: 3,
                backgroundColor: Colors.purple.shade900,
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
