// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/login_page.dart';
import 'package:login/welcome_page.dart';

class AuthController extends GetxController{
  static AuthController instanse = Get.find();
   late Rx<User?> _user;
   FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user == null){
      print('login page');
      Get.offAll(()=>LoginPage());
    }else{
      Get.offAll(()=>WelcomePage(email: user.email as String,));
    }
  }

  Future<void> register(String email,password) async {
    try {
     await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('About User', 'User Message',
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        'Account creation failed',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      messageText: Text(
        e.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      );

    }
  }

    Future<void> login(String email,password) async {
    try {
     await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('About Login', 'Login Message',
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        'Login failed',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      messageText: Text(
        e.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      );

    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }

  Future<void> RestPassword(String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
        Get.offAll(()=>LoginPage());
      });
    } catch (e) {
      Get.snackbar('About User', 'User Message',
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        'invalid Email',
        style: TextStyle(
          color: Colors.white
        ),
      ),
      messageText: Text(
        e.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      );
    }
  }
}