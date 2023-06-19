import 'package:flutter/material.dart';
import 'package:yoga_app/helper/colors.dart';

import '../screens/home.dart';

class LoginCredentials extends StatelessWidget {
  const LoginCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            'Please Log-In',
            style: TextStyle(fontSize: 24),
          ),

          SizedBox(
            height: size.height * 0.03,
          ),

          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    vertical: appPadding * 0.75, horizontal: appPadding),
                fillColor: white,
                hintText: 'Email',
                suffixIcon: Icon(
                  Icons.email_outlined,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.04,
          ),

          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    vertical: appPadding * 0.75, horizontal: appPadding),
                fillColor: white,
                hintText: 'Password',
                suffixIcon: Icon(
                  Icons.lock_outline,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.04,
          ),

          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black.withOpacity(0.4),
                padding: const EdgeInsets.all(10.0),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {},
              child: const Text('Forget Password!'),
            ),
          ),

          // SizedBox(
          //   height: size.height * 0.04,
          // ),

          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: Material(
              elevation: 10.0,
              color: primary,
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                width: size.width,
                height: size.height * 0.06,
                child: Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 18,
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.02,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have Account ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Material(
                  elevation: 0.0,
                  child: Container(
                    width: size.width * 0.15,
                    child: Text(
                      'Sign-Up',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
        ],
      ),
    );
  }
}
