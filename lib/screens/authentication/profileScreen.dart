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
          
          // SizedBox(height: 10),
          Text(
            name.toUpperCase(), // Replace with the user's name
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Fitness Freak', // Replace with the user's occupation
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          _buildInfoTile(Icons.person_outline_rounded, 'Name',
              name), // Replace with user's name
          _buildInfoTile(Icons.phone, 'Email',
              email), // Replace with user's email
          _buildInfoTile(Icons.numbers, 'Phone Number',
              phoneNo), // Replace with user's phnoneNo.
          _buildInfoTile(Icons.person_outline_rounded, 'Age',
              age), // Replace with user's age
          _buildInfoTile(Icons.accessibility_outlined, 'Height',
              height), // Replace with user's height
          _buildInfoTile(Icons.monitor_weight_outlined, 'Weight',
              weight), // Replace with user's weight
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primary,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            
            onPressed: () {
              // Implement the edit profile functionality here
              logUserOut(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('Logout',style: TextStyle(fontSize: 18),)),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(bottom: 10, left: 7, right: 7, top: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.4,
              blurStyle: BlurStyle.outer,
              blurRadius: 4,
            ),
          ],
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
        ),
        child: ListTile(
          leading: Icon(icon,size: 30,color: Colors.black54,),
          title: Text(label,style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w500)),
          subtitle: Text(value,style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w400)),
        ),
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
