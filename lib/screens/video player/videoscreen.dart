import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoga_app/screens/home.dart';
import 'package:yoga_app/screens/todolist.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../helper/colors.dart' as color;
import '../../../helper/colors.dart';
import '../../../widget/sidebar.dart';
import '../bmicalculator.dart';
import '../infopage.dart';

class VideosPlayer extends StatefulWidget {
  const VideosPlayer({super.key});

  @override
  State<VideosPlayer> createState() => _VideosPlayerState();
}

class _VideosPlayerState extends State<VideosPlayer> {
  List videoInfo1 = [];
  List videoInfo2 = [];
  bool _playArea = false;

  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/videoinfo1.json")
        .then((value) {
      setState(() {
        videoInfo1 = json.decode(value);
      });
    });
    DefaultAssetBundle.of(context)
        .loadString("json/videoinfo2.json")
        .then((value) {
      setState(() {
        videoInfo2 = json.decode(value);
      });
    });
  }

  YoutubePlayerController? _controller;

  @override
  void initState() {
    _initData();
    super.initState();

    _controller = null;
  }

  var vidIndex = -1;

  @override
  Widget build(BuildContext context) {
    int selsctedIconIndex = 0;
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        foregroundColor: black,
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          GestureDetector(
            onTap: () {
              _controller?.pause();
              _controller?.dispose();
              Get.to(() => InfoPage());
            },
            child: SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/avatar1.png'),
              ),
            ),
          ),
        ]),
      ),
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
                ),
              )
            : const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: const EdgeInsets.only(
                        top: color.appPadding * 2,
                        left: color.appPadding,
                        right: color.appPadding),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Gereral Yoga \nExcercises',
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
                              child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "120 min",
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Resistance Band, Yoga Mat",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    child: _playView(context),
                  ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70)),
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  thickness: 7,
                  interactive: true,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // list of stress and anxiety relief yoga video builder
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.96,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300],
                                ),
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                    left: 5, top: 10, bottom: 10),
                                margin: const EdgeInsets.only(
                                    left: 18, bottom: 4, top: 8),
                                child: const Text(
                                  'Healing Yoga Exercises',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: _listView(videoInfo1),
                              ),
                            ],
                          ),
                        ),
                        // list of daily yoga video builder
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.96,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300],
                                ),
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                    left: 5, top: 10, bottom: 10),
                                margin: const EdgeInsets.only(
                                    left: 18, bottom: 4, top: 2),
                                child: const Text(
                                  'Daily Yoga Exercises',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: _listView(videoInfo2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selsctedIconIndex,
        buttonBackgroundColor: primary,
        height: 50,
        color: Colors.grey[300]!,
        onTap: (index) {
          setState(() {
            selsctedIconIndex = index;
          });
        },
        animationDuration: const Duration(
          milliseconds: 200,
        ),
        items: <Widget>[
          IconButton(
            onPressed: () {
              Get.to(() => VideosPlayer());
            },
            icon: Icon(
              Icons.play_arrow_outlined,
              size: 25,
              color: selsctedIconIndex == 0 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              _controller?.pause();
              _controller?.dispose();
              Get.to(() => BMICalculator());
            },
            icon: Icon(
              Icons.monitor_weight_outlined,
              size: 25,
              color: selsctedIconIndex == 1 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              _controller?.pause();
              _controller?.dispose();
              Get.to(() => HomeScreen());
            },
            icon: Icon(
              Icons.home_outlined,
              size: 25,
              color: selsctedIconIndex == 2 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              _controller?.pause();
              _controller?.dispose();
              Get.to(() => ToDoList());
            },
            icon: Icon(
              Icons.list_rounded,
              size: 25,
              color: selsctedIconIndex == 3 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              _controller?.pause();
              _controller?.dispose();
              Get.to(() => InfoPage());
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

  Widget _playView(BuildContext context) {
    if (_controller != Null) {
      return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller!,
          showVideoProgressIndicator: true,
          progressColors: ProgressBarColors(
            playedColor: color.AppColor.gradientSecond,
            handleColor: color.AppColor.gradientFirst,
          ),
          aspectRatio: 16 / 9,
        ),
        builder: (context, player) {
          return player;
        },
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Preparing...",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: white),
          ),
        ),
      );
    }
  }

  _initialieVideo(int index, List videoInformation) {
    final videoLink = videoInformation[index]["videoUrl"];

    if (_controller == null) {
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoLink)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          loop: true,
          isLive: false,
        ),
      );
    } else {
      _controller!.load(YoutubePlayer.convertUrlToId(videoLink)!);
    }
  }

  _listView(List videoInformation) {
    return Scrollbar(
      thumbVisibility: true,
      thickness: 7,
      interactive: true,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: appPadding),
        itemCount: videoInformation.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _initialieVideo(index, videoInformation);
              debugPrint(index.toString());

              setState(
                () {
                  if (_playArea == false) {
                    _playArea = true;
                  }
                  _playView(context);
                },
              );
            },
            child: _buildCard(index, videoInformation),
          );
        },
      ),
    );
  }

  _buildCard(int index, List videoInformation) {
    final youtubeVideoLink = videoInformation[index]["videoUrl"];
    final youtubeVideoId = YoutubePlayer.convertUrlToId(youtubeVideoLink)!;
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
                    image: NetworkImage(
                        YoutubeThumbnail(youtubeId: youtubeVideoId).hd()),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoInformation[index]["title"],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    videoInformation[index]["time"],
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
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
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "15 secs",
                  style: TextStyle(color: Color(0xff839fed)),
                ),
              ),
            ),
            const Text(
              "  --------------------------------------------------",
              style: TextStyle(color: Color(0xFF839fed)),
            )
          ],
        )
      ]),
    );
  }
}
