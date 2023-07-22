import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataController extends GetxController {
  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileData = {'userName': '', 'email': '','phoneNo':'','age':'','height':'','weight':''};

  @override
  void onReady() {
    super.onReady();
    // getAllProduct();
    getUserProfileData();
  }
  final userEmail = FirebaseAuth.instance.currentUser!.email;
  Future<void> getUserProfileData() async {
    // print("user id ${authController.userId}");
    try {
      var response = await firebaseInstance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();
      // response.docs.forEach((result) {
      //   print(result.data());
      // });
      if (response.docs.isNotEmpty) {
        userProfileData['userName'] = response.docs[0]['full_name'];
        userProfileData['email'] = response.docs[0]['email'];
        userProfileData['phoneNo'] = response.docs[0]['phone_number'];
        userProfileData['age'] = response.docs[0]['age'];
        userProfileData['height'] = response.docs[0]['height'];
        userProfileData['weight'] = response.docs[0]['weight'];
      }
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print("error aa gyaa");
      print(error);
    }
  }
}
