import 'package:flutter/material.dart';
import 'package:mediped/home/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediped/login/loginScreen.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}


class _LogoutScreenState extends State<LogoutScreen> {

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
              Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),


            ],
          )),
          SizedBox(height: 150,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 300,width: double.infinity,

              decoration: BoxDecoration(/*color: Colors.blueGrey,*/borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [

                  SizedBox(height: 100,),
                  ElevatedButton(onPressed: (){
                    FirebaseAuth.instance.signOut().then((value) {
                      print("logout sucessfully");
                      Navigator.pushReplacement (
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen() ),
                      );
                    });

                  }, child: Text("logout"))
                ],
              ),

            ),
          )

        ],
      ),
    );
  }
}
