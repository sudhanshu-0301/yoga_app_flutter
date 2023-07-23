import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_action/slide_action.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/authentication_repo.dart';
import 'package:yoga_app/screens/authentication/landingscreen.dart';
import 'package:yoga_app/widget/backgroundcircle_landing.dart';
import 'package:just_audio/just_audio.dart';
// import 'package:slide_to_act/slide_to_act.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted>
    with SingleTickerProviderStateMixin {
  final _player = AudioPlayer();

  bool _isContainerVisible = false;
  Offset offset = const Offset(120, 0);
  final double height = 200;
  final double width = 200;
  bool charactermoving = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _updateSize();
    });
  }

  void _updateSize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff28a5da),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Unlock",
                style: Theme.of(context).textTheme.displayMedium!.merge(
                    const TextStyle(
                        color: Colors.white, fontFamily: 'UbuntuBold'))),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
                "Transform Your Spiritual Journey with our Dynamic Fitness App.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .merge(const TextStyle(color: Colors.white))),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: _isContainerVisible ? res_height * 0.5 : 0.0,
            width: _isContainerVisible ? res_width * 0.9 : 0.0,
            curve: Curves.easeOut,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  right: offset.dx - (width / 2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      BackgroundCircle(
                        circleWidth: res_width * 0.9,
                        circleBorderWidth: 80.0,
                        circleOpacity: 0.2,
                        circleColor: Colors.white,
                      ),
                      BackgroundCircle(
                        circleWidth: res_width * 0.8,
                        circleBorderWidth: 40.0,
                        circleOpacity: 0.3,
                        circleColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    RenderBox getBox = context.findRenderObject() as RenderBox;
                    setState(() {
                      offset = getBox.localToGlobal(details.globalPosition);
                      charactermoving = true;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      offset = const Offset(120, 0);
                      charactermoving = false;
                    });
                  },
                  child: SizedBox(
                    height: res_height * 0.5,
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          left: offset.dx - (width / 2),
                          child: SizedBox(
                            width: res_width * 0.9,
                            height: res_height * 0.5,
                            child: Image.asset(
                              'assets/images/character-1.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onPanUpdate: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              setState(() {
                offset = getBox.localToGlobal(details.globalPosition);
                charactermoving = true;
              });
            },
            onPanEnd: (details) {
              setState(() {
                offset = const Offset(120, 0);
                charactermoving = false;
              });
            },
            child: SizedBox(
              height: 44,
              child: !charactermoving
                  ? Image.asset(
                      'assets/images/left-and-right-arrows.png',
                      color: Colors.white,
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Builder(
            builder: (context) {
              // final GlobalKey<SlideActionState> _key = GlobalKey();
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                          state.isPerformingAction
                              ? "Loading..."
                              : "Get Started",
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
              // return Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Container(
              //     width: res_width * 0.8,
              //     child: ElevatedButton(
              //       child: Text("Press Me BABY DOLL"),
              //       onPressed: () {
              //         Get.to(() => const Landingscreen());
              //       },
              //     ),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
