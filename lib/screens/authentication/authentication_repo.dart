import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoga_app/screens/authentication/getstarted.dart';
import 'package:yoga_app/screens/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is LOGGED in
          if (snapshot.hasData) {
            // Get.to(() =>  HomeScreen());
            return  HomeScreen();
          }
          //user is NOT logged in
          else {
            return  GetStarted();
          }
        },
      ),
    );
  }
}




















// import 'dart:math';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:yoga_app/screens/authentication/exceptions/signupemailpasswordfailure.dart';
// import 'package:yoga_app/screens/authentication/getstarted.dart';
// import 'package:yoga_app/screens/home.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get Instance => Get.find();

//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;

//   @override
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }

//   _setInitialScreen(User? user) {
//     user == null
//         ? Get.offAll(() => const GetStarted())
//         : Get.offAll(() => const HomeScreen());
//   }

//   Future<void> createUserWithEmailandPassword(
//       String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       firebaseUser.value != null
//           ? Get.offAll(() => const HomeScreen())
//           : Get.to(() => const GetStarted());
//     } on FirebaseAuthException catch (e) {
//       final ex = SignupWithEmailandPasswordFailure.code(e.code);
//       print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//       throw ex;
//     } catch (_) {
//       const ex = SignupWithEmailandPasswordFailure();
//       print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//       throw ex;
//     }
//   }

//   Future<void> loginUserWithEmailandPassword(
//       String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (a) {
//     } catch (_) {}
//   }

//   Future<void> logout() async => await _auth.signOut();
// }
