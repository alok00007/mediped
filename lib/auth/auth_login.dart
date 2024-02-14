

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  //instance of firestore
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

///for signin
  Future<UserCredential> signInWithEmail (
      String email, String password
      ) async{
    try{
      UserCredential userCredential=await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      //add new document for user in user collection if it doesnot already exists
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
        'email':email
      },SetOptions(merge: true)
      );
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
  ///for signout
   Future<void> signOut() async{
    return await FirebaseAuth.instance.signOut();
   }

   /// signup for new user
    Future<UserCredential> signUpWithEmail
    (String email, password) async{
    try{
      UserCredential userCredential=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      /// after creating the user, create the new documents
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
        'email':email
      });
      print("sucessfully added new documents");
      return userCredential;
    }on FirebaseException catch (e){
      throw Exception(e.code);
    }
  }


}