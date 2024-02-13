import 'package:flutter/material.dart';

class TeamPic extends StatelessWidget {
  const TeamPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children:[
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
                  SizedBox(width: MediaQuery.of(context).size.width*0.3,),
                  Text("TEAM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),

                ],
              )),
              Container(width: double.infinity,height: 50,),

              TeamCard(name: "ABHISHEK",),
              SizedBox(height: 10,),
              TeamCard(name: "AKASH",),
              SizedBox(height: 10,),
              TeamCard(name: "ALOK",),
              SizedBox(height: 10,),
              TeamCard(name: "AYUSH",)
              ]
        ),
      ),
    );
  }
}
class TeamCard extends StatelessWidget {
  final String? name;
  const TeamCard({this.name,super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(child:Row(
      children: [ ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset("assets/images/team/man1.jpg",height: MediaQuery.of(context).size.width*0.3,width: MediaQuery.of(context).size.width*0.4,fit: BoxFit.cover,)),
        SizedBox(width: MediaQuery.of(context).size.width*0.17,),
        Text("$name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30))

      ],
    ));
  }
}
