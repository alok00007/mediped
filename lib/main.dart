



import 'package:flutter/material.dart';
import 'package:mediped/auth/auth_login.dart';
import 'package:mediped/home/dashboard.dart';
import 'package:mediped/login/loginCheck.dart';
import 'package:mediped/login/loginScreen.dart';
import 'package:mediped/screen/team/team.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

      
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBOiKxKNIKErcS43ZWTwphlLK2D4rhQHqc",
          appId: "1:446918119583:android:64bf9cd3dc842f300e92aa",
          messagingSenderId: "446918119583",
          projectId: "mediped-e561f")
    )
  ;
  runApp(
      ChangeNotifierProvider(
        create: (context)=>AuthService(),
        child: MaterialApp(
          home: LoginCheck(),
        )

      )
     );
}






