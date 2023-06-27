import 'package:flutter/material.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/login.dart';
import 'package:yoga_app/widget/backgroundcircle_landing.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'getstarted.dart';

class Landingscreen extends StatefulWidget {
  const Landingscreen({super.key});

  @override
  State<Landingscreen> createState() => _LandingscreenState();
}

class _LandingscreenState extends State<Landingscreen>
    with SingleTickerProviderStateMixin {
  bool _isConatinerVisible = false;
  bool up = false;
  late AnimationController controller;
  final _player = AudioPlayer();

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _updatesize();
    });
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        reverseDuration: Duration(seconds: 2))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });

    controller.forward();
  }

  _updatesize() {
    setState(() {
      _isConatinerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: res_height * 0.1,
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            height: _isConatinerVisible ? res_width * 0.9 : 0.0,
            width: _isConatinerVisible ? res_width * 0.9 : 0.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BackgroundCircle(
                    circleBorderWidth: 80.0,
                    circleColor: Colors.grey,
                    circleOpacity: 0.1,
                    circleWidth: res_width * 0.9),
                BackgroundCircle(
                    circleBorderWidth: 40.0,
                    circleColor: Colors.grey,
                    circleOpacity: 0.2,
                    circleWidth: res_width * 0.8),
                SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(0.0, -0.15), end: Offset(0.0, 0.15))
                      .animate(controller),
                  child: Image.asset('assets/images/character2.png'),
                )
              ],
            ),
          ),
          SizedBox(
            height: res_height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              "The time that leads to mastery is dependent on the intensity of our ffocus.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .merge(TextStyle(color: Colors.grey)),
            ),
          ),
          SizedBox(
            height: res_height * 0.1,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {Get.to(() => const LoginScreen());},
              child: Container(
                width: res_width * 0.46,
                decoration: const BoxDecoration(
                    color: kprimarycolor,
                    borderRadius: BorderRadius.all(Radius.circular(13))),
                child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Icon(
                      //   Icons.restart_alt,
                      //   color: Colors.white,
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Log-in/Sign-up",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .merge(TextStyle(color: Colors.white)))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
