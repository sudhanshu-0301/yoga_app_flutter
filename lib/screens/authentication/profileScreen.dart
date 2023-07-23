import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.indigo, // Replace with your desired color
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    'assets/profile_picture.jpg'), // Replace with your profile picture
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'John Doe', // Replace with the user's name
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'UI/UX Designer', // Replace with the user's occupation
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
            onPressed: () {
              // Implement the edit profile functionality here
            },
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
