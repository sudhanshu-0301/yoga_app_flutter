import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:yoga_app/firebase_options.dart';
import 'package:yoga_app/screens/authentication/authentication_repo.dart';
import 'package:yoga_app/screens/authentication/getstarted.dart';
import 'package:yoga_app/screens/authentication/landingscreen.dart';
import 'package:yoga_app/screens/authentication/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.leftToRight,
      home: GetStarted(),
    );
  }
}
