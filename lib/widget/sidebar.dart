import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/getstarted.dart';
import 'package:yoga_app/screens/home.dart';
import 'package:yoga_app/screens/todolist.dart';
import 'package:yoga_app/screens/video%20player/videoinfo.dart';

import '../screens/calender.dart';

class SideBar extends StatefulWidget {
  SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Map<String, dynamic> fetchedData = <String, dynamic>{};
  @override
  initState() {
    super.initState();
    print('init state called');
    getData();
  }

  void getData() async {
    print('user email: ' + user.email!);
    fetchedData = await getUser(user.email!);
    print('fetched data: ' + fetchedData.toString());
    setState(() {});
  }

  void logUserOut() {
    FirebaseAuth.instance.signOut();

    // Get.to(() => const GetStarted());
  }

  final user = FirebaseAuth.instance.currentUser!;

  //METHOD TO FETCH DATA FROM FIREBASE
  Future<Map<String, dynamic>> getUser(String email) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      print('data: ' + data.toString());
      return data;
    } catch (e) {
      return {'Error_fetching_user': 'Error fetching user'};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: tdBGColor,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(fetchedData['full_name'] ?? 'No Name Found'),
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
              Get.to(() => const VideoInfo());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month_rounded,
              size: 25,
            ),
            title: const Text(
              'Calendar',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Get.to(() => CalenderScreen());
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
              Icons.share_rounded,
              size: 25,
            ),
            title: const Text(
              'Share',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => debugPrint('Share'),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: const Divider(),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_rounded,
              size: 25,
            ),
            title: const Text(
              'Setting',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => debugPrint('Setting'),
          ),
          ListTile(
            leading: const Icon(
              Icons.description_rounded,
              size: 25,
            ),
            title: const Text(
              'Policies',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => debugPrint('Policies'),
          ),
          // Container(height: MediaQuery.of(context).size.height*0.25,),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: const Divider(),
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
}
