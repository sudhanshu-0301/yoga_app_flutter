import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../helper/colors.dart';
import 'calender.dart';
import 'home.dart';
import 'info.dart';
import 'video player/videoinfo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoList();
}

class _ToDoList extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    int selsctedIconIndex = 3;
    return Scaffold(
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
              Get.to(() => const ToDoList());
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
}
