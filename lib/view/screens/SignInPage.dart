import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/FireBaseAuthHelper.dart';
import '../../helper/Global.dart';

class SignInPage extends StatefulWidget {
  final SharedPreferences prefs;

  const SignInPage({Key? key, required this.prefs}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;

  bool isLoggedIn = false;
  checkLogin() {
    isLoggedIn = widget.prefs.getBool(sfLogin) ?? false;
    if (isLoggedIn) {
      Navigator.of(context).pushReplacementNamed('/');
      widget.prefs.setBool(sfLogin, false);
    }
  }

  login() {
    widget.prefs.setBool(sfLogin, true);
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: signInFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset('assets/image/noteslogo.png'),
                Row(
                  children: [
                    Text(
                      "Sign In,start\nNotes!",
                      style: TextStyle(
                          color: Colors.purple.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      " Email",
                      style: TextStyle(
                          color: Colors.purple.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your email first......";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      email = emailController.text;
                    });
                  },
                  controller: emailController,
                  style: TextStyle(color: Colors.purple.shade900),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: "abc253@gmail.com",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.purple.shade900,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      " Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade900,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your password first......";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      password = passwordController.text;
                    });
                  },
                  controller: passwordController,
                  style: TextStyle(color: Colors.purple.shade900),
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: "*********",
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.purple.shade900,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.purple.shade900),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade900,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 150, vertical: 13)),
                    onPressed: () async {
                      if (signInFormKey.currentState!.validate()) {
                        signInFormKey.currentState!.save();

                        Map<String, dynamic> res = await AuthHelper.authHelper
                            .signIn(email: email!, password: password!);

                        if (res['user'] != null) {
                          // login();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Login In Successful....."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                          Navigator.of(context).pushReplacementNamed(
                            'language',
                          );
                        } else if (res['error'] != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(res['error']),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Login In Failed....."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        }
                      }
                      setState(() {
                        emailController.clear();
                        passwordController.clear();
                        email = null;
                        password = null;
                      });
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('signUp');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 15, color: Colors.purple.shade900),
                      ),
                      Text(
                        " Sign Up",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade900),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Map<String, dynamic> res =
                            await AuthHelper.authHelper.signInWithGoogle();
                        if (res['user'] != null) {
                          // login();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                const Text("Login Successful With Google....."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                          Navigator.of(context).pushReplacementNamed(
                            'language',
                          );
                        } else if (res['error'] != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(res['error']),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                const Text("Login Failed With Google....."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        }
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white.withOpacity(0.9),
                        backgroundImage: const AssetImage(
                          'assets/image/googleimage.png',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Map<String, dynamic> res =
                            await AuthHelper.authHelper.logInWithAnonymously();

                        if (res['user'] != null) {
                          // login();

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                const Text("Login Successful As Guest....."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                          Navigator.of(context).pushReplacementNamed(
                            'language',
                          );
                        } else if (res['error'] != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(res['error']),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Login Failed As Guest....."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        }
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
