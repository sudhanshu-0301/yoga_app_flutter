import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/bmicalculator.dart';
import 'package:yoga_app/screens/home.dart';
import 'package:yoga_app/screens/infopage.dart';
import 'package:yoga_app/screens/todolist.dart';
import 'package:yoga_app/screens/video%20player/videoinfo.dart';

import '../controller/get_data_controller.dart';
import '../screens/video player/videoscreen.dart';
import 'SlideActionButton.dart';

class SideBar extends StatefulWidget {
  SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  initState() {
    super.initState();
    print('init state called');
  }

  void logUserOut() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Warning!',
      text: 'Are you sure you want to logout?',
      customAsset: 'assets/images/warning.gif',
      widget: const SlideActionBtn(),
    );
    // FirebaseAuth.instance.signOut();
  }

  final user = FirebaseAuth.instance.currentUser!;
  final DataController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: tdBGColor,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => InfoPage());
            },
            child: UserAccountsDrawerHeader(
              accountName: Text(controller.userProfileData['userName']),
              // accountName: Text('Test Name'),
              accountEmail: Text(user.email!),
          
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_sidebar.jpg'),
                    fit: BoxFit.cover),
              ),
              currentAccountPicture: const CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage('assets/images/avatar1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_rounded,
              size: 25,
            ),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Get.to(() => HomeScreen());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.play_arrow_rounded,
              size: 25,
            ),
            title: const Text(
              'Videos',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Get.to(() => VideosPlayer());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month_rounded,
              size: 25,
            ),
            title: const Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Get.to(() => BMICalculator());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.list_rounded,
              size: 25,
            ),
            title: const Text(
              'To Do List',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Get.to(() => ToDoList());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              size: 25,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(fontSize: 18),
            ),
            onTap: logUserOut,
          ),
        ],
      ),
    );
  }

  // _fetch() async {
  //   final firebaseUser = await FirebaseAuth.instance.currentUser!;
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(firebaseUser.uid)
  //       .get()
  //       .then((ds) {
  //     myEmail = ds.data()!['email'];
  //     print(myEmail);
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
}
