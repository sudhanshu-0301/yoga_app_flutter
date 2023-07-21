import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/calender.dart';
import 'package:yoga_app/screens/todolist.dart';
import 'package:yoga_app/widget/listcourses.dart';

import '../widget/diffstyles.dart';
import '../widget/sidebar.dart';
import 'info.dart';
import 'video player/videoinfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> fetchedData = <String, dynamic>{};

  final user = FirebaseAuth.instance.currentUser!;
  int selectedIconIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        foregroundColor: black,
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar1.png'),
            ),
          ),
        ]),
      ),
      backgroundColor: white,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              // height: MediaQuery.of(context).size.height * 0.04,
              ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          DiffStyles(),
          Courses()
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selectedIconIndex,
        buttonBackgroundColor: Colors.blue.shade400,
        height: 50,
        color: Colors.grey[200]!,
        onTap: (index) {
          setState(() {
            selectedIconIndex = index;
          });
        },
        animationDuration: const Duration(
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
              color: selectedIconIndex == 0 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => CalenderScreen());
            },
            icon: Icon(
              Icons.calendar_month_rounded,
              size: 25,
              color: selectedIconIndex == 1 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => HomeScreen());
            },
            icon: Icon(
              Icons.home_outlined,
              size: 25,
              color: selectedIconIndex == 2 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => ToDoList());
            },
            icon: Icon(
              Icons.list_rounded,
              size: 25,
              color: selectedIconIndex == 3 ? white : black,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => BMICalculator());
            },
            icon: Icon(
              Icons.monitor_weight_rounded,
              size: 25,
              color: selectedIconIndex == 4 ? white : black,
            ),
          ),
        ],
      ),
    );
  }
}
