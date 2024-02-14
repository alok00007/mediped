import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediped/home/dashboard.dart';
import 'package:mediped/login/loginScreen.dart';
class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
        if(snapshot.hasData){
          print("user is already login");
          return Dashboard();
        }
        else
          {
            print("user is not login");
            return LoginScreen();
          }
      })
    );
  }
}
