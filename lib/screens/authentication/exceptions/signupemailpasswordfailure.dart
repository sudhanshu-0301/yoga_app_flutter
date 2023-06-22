import 'package:get/get.dart';

class SignupWithEmailandPasswordFailure {
  final String message;

  const SignupWithEmailandPasswordFailure(
      [this.message = "An Unknown error occured."]);

  factory SignupWithEmailandPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupWithEmailandPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const SignupWithEmailandPasswordFailure(
            'Email is valid or badly formattd.');
      case 'email-already-in-use':
        return const SignupWithEmailandPasswordFailure(
            'An account already exists for that email.');
      case 'operation-not-allowed':
        return const SignupWithEmailandPasswordFailure(
            'operation not allowed. Please contact support.');
      case 'user-disabled':
        return const SignupWithEmailandPasswordFailure(
            'THis user is disabled. Please contact support for help.');
      default:
        return const SignupWithEmailandPasswordFailure();
    }
  }
}
