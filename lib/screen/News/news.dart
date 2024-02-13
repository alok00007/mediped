import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({super.key});

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
              Text("NEWS/BLOGS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

            ],
          )),
          SizedBox(height: 400,),
          Text(".......Coming soon....")

        ],
      ),
    );
  }
}
