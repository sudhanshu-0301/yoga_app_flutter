import 'package:flutter/material.dart';

class ProfilePage1 extends StatelessWidget {
  final String name;
  final String email;
  final String profileImageURL;
  final String phoneNo;
  final String age;
  final String height;
  final String weight;

  ProfilePage1({
    required this.name,
    required this.email,
    required this.profileImageURL,
    required this.phoneNo,
    required this.age,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(profileImageURL),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Profile',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'PTSerif-Regular'),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Expanded(child: Container()),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Expanded(child: Container()),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontFamily: 'PTSerif-Italic'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Age',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Expanded(child: Container()),
                  Text(
                    age,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Height',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Expanded(child: Container()),
                  Text(
                    height,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Weight',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Expanded(child: Container()),
                  Text(
                    weight,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Phone No.',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Expanded(child: Container()),
                  Text(
                    phoneNo,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
        Divider(),
      ],
    );
  }
}
