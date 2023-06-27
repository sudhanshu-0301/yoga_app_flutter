import 'dart:convert';
import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:yoga_app/screens/calender.dart';
import 'package:yoga_app/screens/home.dart';
import '../../helper/colors.dart' as color;
import '../../helper/colors.dart';
import '../info.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selsctedIconIndex = 0;
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                colors: [
                  color.AppColor.gradientFirst,
                  color.AppColor.gradientSecond
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              ))
            : BoxDecoration(color: color.AppColor.gradientSecond),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: const EdgeInsets.only(
                        top: color.appPadding * 2.5,
                        left: color.appPadding,
                        right: color.appPadding),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.29,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back_ios,
                                  size: 20, color: color.white),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text('Legs Toning \nand Glutes Workout',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor.gradientSecond,
                                        color.AppColor.gradientFirst
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "68 min",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    )
                                  ]),
                            ),
// 2
                            const SizedBox(
                              width: 20,
                            ),
// 2
                            Container(
                              width: 210,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor.gradientSecond,
                                        color.AppColor.gradientFirst
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.handyman_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Resistance Band, Ketteble",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    )
                                  ]),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 30, left: 20, right: 20),
                          height: 70,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              const Icon(
                                Icons.info_outline,
                                size: 20,
                                color: white,
                              )
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Text(
                        'Circuit 1 : Legs Toning',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      const Text(
                        '3 Sets',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Expanded(child: _listView())
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selsctedIconIndex,
        buttonBackgroundColor: primary,
        height: 50,
        color: white,
        onTap: (index) {
          setState(() {
            selsctedIconIndex = index;
          });
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        items: <Widget>[

          IconButton(
            onPressed: () {
              Get.to(() => const VideoInfo());
            },
            icon: Icon(
              Icons.play_arrow_outlined,
              size: 25,
              color: selsctedIconIndex == 0 ? white : black,
            ),
          ),

          IconButton(
            onPressed: () {
              Get.to(() => const CalenderScreen());
            },
            icon: Icon(
              Icons.calendar_month_rounded,
              size: 25,
              color: selsctedIconIndex == 1 ? white : black,
            ),
          ),
          
          IconButton(
            onPressed: () {
              Get.to(() => const HomeScreen());
            },
            icon: Icon(
              Icons.home_outlined,
              size: 25,
              color: selsctedIconIndex == 2 ? white : black,
            ),
          ),

          IconButton(
            onPressed: () {
              Get.to(() => const CalenderScreen());
            },
            icon: Icon(
              Icons.list_rounded,
              size: 25,
              color: selsctedIconIndex == 3 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const UsersInfo());
            },
            icon: Icon(
              Icons.person_outline,
              size: 25,
              color: selsctedIconIndex == 4 ? white : black,
            ),
          ),
          
        ],
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red.shade700,
            inactiveTrackColor: Colors.red.shade100,
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            value: max(0, min(_progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value?.duration;
              if (duration != null) {
                var newValue = max(0, min(value, 99) * 0.01);
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(bottom: 10),
          color: color.AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0))
                    ]),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && videoInfo.length >= 0) {
                    _initialieVideo(index);
                  } else {
                    Get.snackbar("Video", "",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: Icon(
                          Icons.face,
                          size: 30,
                          color: white,
                        ),
                        backgroundColor: color.AppColor.gradientSecond,
                        colorText: Colors.white,
                        messageText: Text(
                          "No more previous videos to play",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= videoInfo.length - 1) {
                    _initialieVideo(index);
                  } else {
                    Get.snackbar("Video", "",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: Icon(
                          Icons.face,
                          size: 30,
                          color: white,
                        ),
                        backgroundColor: color.AppColor.gradientSecond,
                        colorText: Colors.white,
                        messageText: Text(
                          "You finished watching all the videos. Congrats!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "$mins:$secs",
                  style: TextStyle(
                    color: white,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(150, 0, 0, 0))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;

    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            "Preparing...",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: white),
          )));
    }
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }

    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller is not initialized");
      return;
    }

    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }

    _isPlaying = playing;
  }

  _initialieVideo(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(int index) {
    _initialieVideo(index);
  }

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      itemCount: videoInfo.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
          onTap: () {
            _onTapVideo(index);
            debugPrint(index.toString());
            setState(() {
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                      videoInfo[index]["thumbnail"],
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoInfo[index]["title"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 13),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(color: Colors.grey),
                    ))
              ],
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          children: [
            Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "15 secs",
                  style: TextStyle(color: Color(0xff839fed)),
                ),
              ),
            ),
            Text(
              "  --------------------------------------------------",
              style: TextStyle(color: Color(0xFF839fed)),
            )
          ],
        )
      ]),
    );
  }
}
