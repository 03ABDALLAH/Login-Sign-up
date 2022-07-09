import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:login/auth_controller.dart';

class ResetPage extends StatelessWidget {
  ResetPage({ Key? key }) : super(key: key);

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Reset Page',
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            AuthController.instanse.RestPassword(emailController.text);
          },
          child: Text('Reset Password')),
        ],
      ),      
    );
  }
}