import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/screens/authentication/authentication_repo.dart';
import 'package:yoga_app/screens/authentication/googleSignIn.dart';
import 'package:yoga_app/widget/SlideActionButton.dart';

import '../../widget/backgroundImage_login.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String profileImageURL;
  final String phoneNo;
  final String age;
  final String height;
  final String weight;

  const ProfilePage(
      {super.key,
      required this.name,
      required this.email,
      required this.profileImageURL,
      required this.phoneNo,
      required this.age,
      required this.height,
      required this.weight});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [

          BackgroundImage(imgURL:profileImageURL,height: size.height*0.35,),
          
          SizedBox(height: 20),
          Text(
            name, // Replace with the user's name
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Fitness Freak', // Replace with the user's occupation
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30),
          _buildInfoTile(Icons.email, 'Email',
              'john.doe@example.com'), // Replace with user's email
          _buildInfoTile(Icons.phone, 'Phone',
              '+1 234-567-8900'), // Replace with user's phone number
          _buildInfoTile(Icons.location_on, 'Location',
              'New York, USA'), // Replace with user's location
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primary),
            onPressed: () {
              // Implement the edit profile functionality here
              logUserOut(context);
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 10, left: 7, right: 7, top: 10),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.6,
            blurStyle: BlurStyle.outer,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      // padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }

  void logUserOut(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title:  'Warning!',
      text: 'Are you sure you want to logout?',
      customAsset: 'assets/images/warning.gif',
      widget: const SlideActionBtn(),
    );
    // FirebaseAuth.instance.signOut();
  }
}
