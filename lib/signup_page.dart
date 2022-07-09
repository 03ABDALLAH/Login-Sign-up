// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/auth_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    bool _isVisible = false;
    bool _isPasswordEightCharacters = false;
    bool _hasPasswordOneNumber = false;

    List images =[
      'g.png',
      't.png',
      'f.png'
    ];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h*0.2,
            child: Column(
              children: [
                SizedBox(height: w*0.1,),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 30,
                  backgroundImage: AssetImage('img/profile1.png'),
                )
              ],
            ),
          ),
          SizedBox(height: h*0.05,),
          Container(
            width: w,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(height: 10),
              ],  
            ),
          ),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              AuthController.instanse.register(emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                    "img/loginbtn.png",
                  ),
                  fit: BoxFit.cover,
                )
              ),
              child: Center(
                child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
              text: 'Have an account?',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              )
            ),
          ),
          SizedBox(height: w*0.1,),
          RichText(text: TextSpan(
            text: 'Sign up using one of the following methods',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
            ), 
          )),
          Wrap(
            children: List<Widget>.generate(
              3,
              (index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[500],
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        'img/'+images[index]
                      ),
                    ),
                  ),
                );
              }
            ),
          )
        ],
      )
      
    );
  }
}