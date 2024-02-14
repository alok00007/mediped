import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediped/model/message.dart';

class ChatService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  //sending the message
Future<void> sendMessage(String receiverId,String message)async{
  final String currentUserId=_firebaseAuth.currentUser!.uid;
  final String currentUserEmail=_firebaseAuth.currentUser!.email.toString();
  final Timestamp timestamp=Timestamp.now();
  //create a new message
  Message newMessage= Message(
    senderId:currentUserId,
    senderEmail:currentUserEmail,
    receiverId:receiverId,
    timestamp:timestamp,
    message:message,
  );
  List<String> ids=[currentUserId,receiverId];
  ids.sort();
  String chatRoomId=ids.join("_");
  await _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').add(newMessage.toMap());
  
}
//get messages
Stream<QuerySnapshot>getMessages(String userId,String otherUserId){
  List<String> ids=[userId,otherUserId];
  ids.sort();
  String chatRoomId=ids.join("_");
  return _firestore
      .collection('chat_rooms')
      .doc(chatRoomId)
      .collection('messages')
      .orderBy('timestamp',descending: false)
      .snapshots();
}

}