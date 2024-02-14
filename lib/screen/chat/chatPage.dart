import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chatService.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
  const ChatPage({super.key,required this.receiverUserEmail,required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController=TextEditingController();
  final ChatService _chatService=ChatService();
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  void sendMessage() async{
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(widget.receiverUserId, _messageController.text);

      _messageController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Expanded(child: _buildMessageList(),),

          _buildMessageInput()
        ],

      ) ,
    );
  }
  Widget _buildMessageList(){
    return StreamBuilder(stream: _chatService.getMessages(widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder: (context,snapshot){
      if(snapshot.hasError){
        return Text('Error${snapshot.error}');
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return Text('Loading---');
      }
      return ListView(
        children: snapshot.data!.docs.map((document)=>_buildMessageItem(document)).toList(),
      );
        });
  }

   Widget _buildMessageItem( document){
    Map<String,dynamic> data =document.data() as Map<String,dynamic>;
    return Container(
      child: Column(
        children: [
          Text(data['senderEmail']),
          Text(data['message']),
        ],
      ),
    );
   }

  Widget _buildMessageInput(){
    return Row(
      children: [
        Expanded(child:
        TextField(
          controller: _messageController,

        )
        ),

        IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward,size: 40,))
      ],
    );
  }


}
