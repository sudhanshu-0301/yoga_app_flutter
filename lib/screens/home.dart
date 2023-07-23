import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/todolist.dart';
import 'package:yoga_app/widget/listcourses.dart';

import '../controller/get_data_controller.dart';
import '../widget/diffstyles.dart';
import '../widget/sidebar.dart';
import 'bmicalculator.dart';
import 'video player/videoinfo.dart';
import 'infopage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  int selsctedIconIndex = 2;
  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        foregroundColor: black,
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          GestureDetector(
            onTap: () {
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
      backgroundColor: Colors.grey[100],
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   // height: MediaQuery.of(context).size.height * 0.04,
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     const Text(
          //       'Welcome Back...',
          //       style: TextStyle(
          //           fontSize: 30,
          //           fontWeight: FontWeight.w400,
          //           color: primary,
          //           fontStyle: FontStyle.italic),
          //     ),
          //     Text(
          //       user.email!,
          //       style: const TextStyle(
          //         fontSize: 22,
          //         fontWeight: FontWeight.w300,
          //         color: primary,
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          DiffStyles(),
          Courses()
        ],
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
}
