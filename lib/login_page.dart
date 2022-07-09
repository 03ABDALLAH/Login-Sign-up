// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:login/auth_controller.dart';
import 'package:login/reset_password.dart';
import 'package:login/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Login',style: TextStyle(color: Colors.black,fontSize: 40),),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: h*0.1,),
          Container(
            width: w,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Sign into your account',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email,color: Colors.deepOrangeAccent,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible ? Icon(Icons.visibility, color: Colors.black) : Icon(Icons.visibility_off, color: Colors.deepOrange,),
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password_outlined,color: Colors.deepOrangeAccent,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                          color: Colors.black,
                          ),
                      )
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPage()));
                      },
                      child: Text(
                        'Forgot your Password? ',
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ],  
            ),
          ),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              AuthController.instanse.login(emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w*0.9,
              height: h*0.08,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(
                    "img/loginbtn.png",
                  ),
                  fit: BoxFit.cover,
                )
              ),
              child: Center(
                child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
              ),
            ),
          ),
          SizedBox(height: w*0.35,),
          RichText(text: TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 20,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextSpan(
                text: ' Create',
                style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage())
              )
            ]
          ))
        ],
      )
    );
  }
}