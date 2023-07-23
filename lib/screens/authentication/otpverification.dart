import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:yoga_app/helper/colors.dart';

class OTPScreen extends StatelessWidget {
  final String userInput;
  const OTPScreen({super.key, required this.userInput});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CO\nDE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0),
              ),
              Text(
                'Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Text(
                'Enter the verification code sent at ' + userInput,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  print("otp is $code");
                },
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.07,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 18),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
