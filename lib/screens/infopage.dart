import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/profileScreen.dart';
import 'package:yoga_app/screens/todolist.dart';

import '../controller/get_data_controller.dart';
import '../widget/profile_body.dart';
import '../widget/sidebar.dart';
import 'bmicalculator.dart';
import 'home.dart';
import 'video player/videoinfo.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final DataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    int selsctedIconIndex = 4;
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
      body: SingleChildScrollView(
        child: ProfilePage(
          phoneNo: controller.userProfileData['phoneNo'],
          name: controller.userProfileData['userName'],
          email: controller.userProfileData['email'],
          weight: controller.userProfileData['weight'],
          height: controller.userProfileData['height'],
          age: controller.userProfileData['age'],
          profileImageURL: 'assets/images/avatar1.png',
        ),
      ),

      // bottom navbar
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
              Icons.person_2_rounded,
              size: 25,
              color: selsctedIconIndex == 4 ? white : black,
            ),
          ),
        ],
      ),
    );
  }
}
