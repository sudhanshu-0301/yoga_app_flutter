import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/login.dart';

import 'otpverification.dart';

class ForgetPasswordWithMail extends StatelessWidget {
  const ForgetPasswordWithMail({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
              top: appPadding, left: appPadding, right: appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              // Image and title--------------
              Image(
                image: AssetImage('assets/images/forgetpassword.png'),
                height: size.height * 0.30,
              ),
              const Text(
                'Forget Password',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Text(
                'Enter your registered E-Mail to receive OTP',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),

              // --------Registration form----------------
              SizedBox(
                height: size.height * 0.05,
              ),

              Form(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'E-Mail',
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          size: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),SizedBox(
                height: size.height * 0.04,
              ),
                    SizedBox(
                      height: size.height * 0.07,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {Get.to(() => OTPScreen());},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
