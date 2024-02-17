import 'package:flutter/material.dart';
import 'package:mediped/auth/auth_login.dart';
import 'package:mediped/home/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediped/login/signUp.dart';
import 'package:mediped/theme/color.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
TextEditingController emailC = TextEditingController();
TextEditingController passwordC = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  void login() async
  {
    print("email id is:${emailC.text.toString()}");
    final authService=Provider.of<AuthService>(context,listen: false);
    try{
      await authService.signInWithEmail(emailC.text, passwordC.text);
      Navigator.pushReplacement (
        context,
        MaterialPageRoute(builder: (context) => Dashboard() ),
      );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("ERROR:${e.toString()}")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
      body: Container(decoration: BoxDecoration(gradient: gradientColor),
        child: Column(
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
                SizedBox(width: MediaQuery.of(context).size.width*0.25,),
                Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: textColor),),


              ],
            )),
            SizedBox(height: MediaQuery.of(context).size.height*0.15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: double.infinity,

                decoration: BoxDecoration( borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailC,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "your email id",labelStyle: TextStyle(color: textColor),
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
                    SizedBox(height: 5,),
                    TextFormField(
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
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          login();
                        });



                        emailC.clear();
                        passwordC.clear();
                      },
                      child: Container(width: MediaQuery.of(context).size.width*0.8,height: 50,
                        decoration: BoxDecoration(color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                        )
                        ,child: Center(child: Text("Login",style: TextStyle(fontSize: 30),)),

                      ),
                    ),
                    SizedBox(height: 20,),

                    GestureDetector(
                        onTap: (){
                          Navigator.push (
                            context,
                            MaterialPageRoute(builder: (context) => SignUp() ),
                          );
                        }
                        ,child: Row(
                      children: [
                        SizedBox(width:MediaQuery.of(context).size.width*0.2),
                        Text("New User ?",style: TextStyle(color: textColor),),
                        Text(" Register Now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: textColor),),
                      ],
                    ))
                  ],
                ),

              ),
            )

          ],
        ),
      ),
    );
  }
}
