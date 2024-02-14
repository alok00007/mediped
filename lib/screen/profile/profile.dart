import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mediped/auth/auth_login.dart';
import 'package:mediped/login/loginScreen.dart';
import 'package:mediped/login/logout.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  void signout(){
    final authService=Provider.of<AuthService>(context,listen: false);
    authService.signOut();
    print("signout sucessfully");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height:50),
          Positioned(
              right:0
              ,child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },child:  Image.asset("assets/images/back.png",scale: 5,),
              ),
              SizedBox(width: 60,),
              Text("PROFILE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 100,width: 60,),
              IconButton(onPressed: (){
                signout();
                Navigator.push (
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen() ),
                );
              }, icon: Icon(Icons.logout),iconSize: 60,)


            ],
          )),


        ],
      ),
    );;
  }
}
