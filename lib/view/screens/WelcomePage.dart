import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset('assets/image/noteslogo.png'),
            Text(
              "Notes in your heart, learning in your soul",
              // "keep your notes organized and your life\n      simplified. Let's start your notes",
              style: TextStyle(color: Colors.purple.shade900, fontSize: 15),
            ),
            const SizedBox(
              height: 160,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110, vertical: 10),
                    backgroundColor: Colors.purple.shade900),
                onPressed: () {
                  Navigator.of(context).pushNamed('language');
                },
                child: const Text(
                  "Let's Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('signIn');
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: Colors.purple.shade900,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
