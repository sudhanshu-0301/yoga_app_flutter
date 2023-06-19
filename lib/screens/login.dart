import 'package:flutter/material.dart';
import 'package:yoga_app/widget/login_credential.dart';

import '../widget/backgroundImage_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackgroundImage(),
            LoginCredentials(),
          ],
        ),
      ),
    );
  }
}
