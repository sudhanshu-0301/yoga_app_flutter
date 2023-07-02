import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../helper/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  // final user = FirebaseAuth.instance.currentUser!;
  // void logUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(appPadding / 8),
                child: Container(
                  decoration: const BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: white,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(appPadding / 8),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/avatar.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                    color: black, fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  const Icon(
                    Icons.notifications_none_rounded,
                    size: 30.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '0',
                        style: TextStyle(color: white, fontSize: 8),
                      ),
                    ),
                  )
                ],
              ),
              Transform(
                transform: Matrix4.rotationY(math.pi),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.sort_rounded,
                    size: 30.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
