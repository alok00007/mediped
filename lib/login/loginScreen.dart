import 'package:flutter/material.dart';
import 'package:mediped/auth/auth_login.dart';
import 'package:mediped/home/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediped/login/signUp.dart';
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
              Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),


            ],
          )),
          SizedBox(height: 150,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 300,width: double.infinity,

            decoration: BoxDecoration(/*color: Colors.blueGrey,*/borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
              TextFormField(
              controller: emailC,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "your email id",
                labelText: 'Email',
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
                SizedBox(height: 10,),
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
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      login();
                    });



                    emailC.clear();
                    passwordC.clear();
                    },
                  child: Stack(
                    children: [

                       Container(width: double.infinity,height: 50,color: Colors.green
                          ,

                        ),

                      Positioned(left: 150 ,child: Text("Login",style: TextStyle(fontSize: 30),))
                    ],
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
                    SizedBox(width:100),
                    Text("New User ?"),
                    Text(" Register Now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  ],
                ))
              ],
            ),
            
            ),
          )

        ],
      ),
    );
  }
}
