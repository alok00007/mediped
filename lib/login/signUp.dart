import 'package:mediped/auth/auth_login.dart';
import 'package:mediped/home/dashboard.dart';
import 'package:mediped/theme/color.dart';

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
      body: Container(decoration: BoxDecoration(gradient: gradientColor),
        child: Column(
          children: [
            SizedBox(height:50),
            Positioned(
                right:0
                ,child: Row(
              children: [
                SizedBox(width:MediaQuery.of(context).size.width*0.05,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },child:  Image.asset("assets/images/back.png",scale: 8,color: textColor,),
                ),
                SizedBox(width:MediaQuery.of(context).size.width*0.20,),
                Text("SignUp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: textColor),),




              ],
            )),

            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "your Email",labelStyle: TextStyle(color: textColor),
                  labelText: 'Email',hintStyle: TextStyle(color: textColor),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20.0)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20.0)),
                ),style: TextStyle(color: textColor),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more validation logic here if needed
                  return null;
                },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "your password",labelStyle: TextStyle(color: textColor),
                  labelText: 'Password',hintStyle: TextStyle(color: textColor),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20.0)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20.0)),
                ),style: TextStyle(color: textColor),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  // You can add more validation logic here if needed
                  return null;
                },
              ),
            ),
            GestureDetector(
              onTap: (){
                signup();
                emailC.clear();
                passwordC.clear();


              },child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19,color: textColor),)),
                          ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
