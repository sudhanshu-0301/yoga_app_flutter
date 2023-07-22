import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/signup.dart';
import 'package:yoga_app/screens/home.dart';

import '../../widget/backgroundImage_login.dart';
import '../../widget/forgetpasswordbuttonwidget.dart';
import 'forgetpasswordwithmail.dart';
import 'forgetpasswordwithphone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;

  //  text controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // login user logic
  void logUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        debugPrint('User not found');
      } else if (e.code == 'wrong-password') {
        debugPrint('wrong password');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // part one --- starting image-----
            const BackgroundImage(),

            // part two ----form----
            SizedBox(
              height: size.height * 0.015,
            ),

            Form(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: appPadding * 0.75),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'E-Mail',
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          size: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.01,
                    ),

                    TextField(
                      controller: passwordTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                      ),
                      obscureText: passwordVisible,
                    ),

                    // SizedBox(height: size.height * 0.005),

                    // ----------forget pasword section------------
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // -----------------password reset type selection------------
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            context: context,
                            builder: (context) => Container(
                              padding: const EdgeInsets.all(appPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  const Text(
                                    'Make Selection!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  const Text(
                                    'Select one of the options given below to reset your password.',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                                  forgetpasswordbtnwidget(
                                    btnIcon: Icons.mail_outline_rounded,
                                    title: 'E-Mail',
                                    subTitle: 'Reset via Mail varification.',
                                    onTap: () {
                                      Get.to(() => ForgetPasswordWithMail());
                                    },
                                  ),

                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),

                                  forgetpasswordbtnwidget(
                                    btnIcon: Icons.mobile_friendly_rounded,
                                    title: 'Phonr No',
                                    subTitle:
                                        'Reset via Phone No varification.',
                                    onTap: () {
                                      Get.to(() => ForgetPasswordWithPhone());
                                    },
                                  ),
                                  // ------------------forget password end----------------
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Forget Password!',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.06,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          logUserIn();
                          // Get.to(() => const HomeScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child:
                            const Text('LOGIN', style: TextStyle(fontSize: 16)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ------------------------form end------------
            SizedBox(
              height: size.height * 0.015,
            ),

            // last part ----- Sign up ------
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'OR',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                SizedBox(
                  width: size.width * 0.9,
                  child: OutlinedButton.icon(
                      icon: const Image(
                        image: AssetImage(
                          'assets/images/google logo.png',
                        ),
                      ),
                      onPressed: () {},
                      label: Text('Sign-In with Google')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SignUpscreen());
                        },
                        child: const Text('Sign-Up',
                            style: TextStyle(fontSize: 16))),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
