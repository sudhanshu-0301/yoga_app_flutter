import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/login.dart';

import '../../controller/signupcontroller.dart';

class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  // text controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final ageTextController = TextEditingController();
  final fullNameTextController = TextEditingController();
  final phoneNoTextController = TextEditingController();
  final heightTextController = TextEditingController();
  final weightTextController = TextEditingController();

  // on submit signup button logic
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        // name:nameController.text,
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      addUserDetails(
          fullName: fullNameTextController.text,
          age: ageTextController.text,
          phoneNo: phoneNoTextController.text,
          height: heightTextController.text,
          weight: weightTextController.text,
          email: emailTextController.text,
          );

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        print('User not found');
      } else if (e.code == 'wrong-password') {
        print('wrong password');
      }
    }
  }

  Future addUserDetails(
      {required String fullName,
      required String age,
      required String phoneNo,
      required String height,
      required String weight,
      required String email}) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full_name': fullName,
      'age': age,
      'phone_number': phoneNo,
      'height': height,
      'weight': weight,
      'email':email,
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: appPadding, right: appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image and title--------------
              Image(
                image: AssetImage('assets/images/welcome1.png'),
                height: size.height * 0.30,
              ),
              const Text(
                'Welcome! Get on Board',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Create your profile and begin your Fitness Journey.',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              // --------Registration form----------------
              SizedBox(
                height: size.height * 0.01,
              ),
              Form(
                // key: formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: fullNameTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Full Name',
                        suffixIcon: const Icon(
                          Icons.person_outline_rounded,
                          size: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextField(
                      controller: emailTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'E-mail',
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
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Password',
                        suffixIcon: const Icon(
                          Icons.fingerprint,
                          size: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextField(
                      controller: ageTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Age',
                        suffixIcon: const Icon(
                          Icons.person_outline_rounded,
                          size: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextField(
                      controller: phoneNoTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Phone No',
                        suffixIcon: const Icon(
                          Icons.numbers,
                          size: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextField(
                      controller: heightTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Height',
                        suffixIcon: const Icon(
                          Icons.accessibility_outlined,
                          size: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextField(
                      controller: weightTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Weight',
                        suffixIcon: const Icon(
                          Icons.assignment_ind_outlined,
                          size: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          signUserUp();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text(
                          'SIGNUP',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),

// ---------------form end--------------------------
              SizedBox(
                height: size.height * 0.01,
              ),
// last part google signup-------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'OR',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
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
                        "Already have an Account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => LoginScreen());
                          },
                          child: const Text('Log-In',
                              style: TextStyle(fontSize: 16))),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
