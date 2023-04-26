import 'package:firebase_notes/helper/Global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/FireBaseAuthHelper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String? email;
  String? password;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: signUpFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset('assets/image/noteslogo.png'),
                Row(
                  children: [
                    Text(
                      "Create an account,\nLet's get started!",
                      style: TextStyle(
                          color: Colors.purple.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your name first......";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      name = nameController.text;
                    });
                  },
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.purple.shade900),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Name",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.purple.shade900,
                      )),
                ),
                const SizedBox(
                  height: 10,
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
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.purple.shade900),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Email or Phone",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.purple.shade900,
                      )),
                ),
                const SizedBox(
                  height: 10,
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
                  obscureText: true,
                  style: TextStyle(color: Colors.purple.shade900),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "password",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.purple.shade900,
                      )),
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade900,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 145, vertical: 10)),
                    onPressed: () async {
                      if (signUpFormKey.currentState!.validate()) {
                        signUpFormKey.currentState!.save();

                        Map<String, dynamic> res = await AuthHelper.authHelper
                            .signUp(
                                name: name!,
                                email: email!,
                                password: password!);

                        if (res['user'] != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Sign Up Successful....."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        } else if (res['error'] != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(res['error']),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        } else {
                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Sign Up Failed....."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purple.shade900,
                          ));
                        }
                        Navigator.of(context).pop();
                      }
                      setState(() {
                        emailController.clear();
                        nameController.clear();
                        passwordController.clear();
                        email = null;
                        password = null;
                        name = null;
                      });
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.purple.shade900),
                      ),
                      Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.purple.shade900,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
