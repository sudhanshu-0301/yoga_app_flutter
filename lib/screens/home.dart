import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/widget/listcourses.dart';

import '../widget/custom_navbar_hometop.dart';
import '../widget/diffstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selsctedIconIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.only(top: appPadding * 2),
        child: Column(
          children: [
            CustomAppBar(),
            DiffStyles(),
            Courses()
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selsctedIconIndex,
        buttonBackgroundColor: primary,
        height: 60.0,
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
          Icon(Icons.play_arrow_outlined, size: 30,color: selsctedIconIndex == 0 ? white : black,),
          Icon(Icons.search, size: 30,color: selsctedIconIndex == 1 ? white : black,),
          Icon(Icons.home_outlined, size: 30,color: selsctedIconIndex == 2 ? white : black,),
          Icon(Icons.favorite_border_outlined, size: 30,color: selsctedIconIndex == 3 ? white : black,),
          Icon(Icons.person_outline, size: 30,color: selsctedIconIndex == 4 ? white : black,),
        ],
      ),
    );
  }
}
    
