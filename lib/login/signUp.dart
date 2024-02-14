import 'package:mediped/auth/auth_login.dart';
import 'package:mediped/home/dashboard.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
final emailC=TextEditingController();
final passwordC=TextEditingController();
class _SignUpState extends State<SignUp> {

  void signup() async
  {
    final authService=Provider.of<AuthService>(context,listen: false);
    try{
      await authService.signUpWithEmail(emailC.text, passwordC.text);
      Navigator.pushReplacement (
        context,
        MaterialPageRoute(builder: (context) => Dashboard() ),
      );
    } catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
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
              Text("SignUp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),




            ],
          )),

          SizedBox(height: 200,),
          TextFormField(
            controller: emailC,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "your Email",
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // You can add more validation logic here if needed
              return null;
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: passwordC,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "your password",
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              // You can add more validation logic here if needed
              return null;
            },
          ),
          GestureDetector(
            onTap: (){
              signup();


            },child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(15)),
              child: Center(child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19),)),
                        ),
            ),
          )

        ],
      ),
    );
  }
}
