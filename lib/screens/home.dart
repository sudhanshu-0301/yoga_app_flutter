import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoga_app/helper/colors.dart';

import '../widget/custom_navbar_hometop.dart';
import '../widget/diffstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          ],
        ),
      ),
    );
  }
}
