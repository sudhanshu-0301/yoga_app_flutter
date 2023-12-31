import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_action/slide_action.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/authentication_repo.dart';

class SlideActionBtn extends StatelessWidget {
  const SlideActionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SlideAction(
        trackBuilder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Text(
                // Show loading if async operation is being performed
                state.isPerformingAction ? "Loading..." : "Slide to logout",
              ),
            ),
          );
        },
        thumbBuilder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              // Show loading indicator if async operation is being performed
              child: state.isPerformingAction
                  ? const CupertinoActivityIndicator(
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
            ),
          );
        },
        action: () async {
          // Async operation
          await Future.delayed(
            const Duration(seconds: 2),
            () {
              Get.to(AuthPage());
              FirebaseAuth.instance.signOut();

              debugPrint("action completed");
            },
          );
        },
      ),
    );
  }
}
