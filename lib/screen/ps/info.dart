import 'package:flutter/material.dart';
import 'package:mediped/theme/color.dart';

class info extends StatelessWidget {
  const info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
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
              SizedBox(width: 10,),
              Text("SOLUTION",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),


            ],
          )),
          SizedBox(height: 150,),
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: Material(
              elevation: 50,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 380,
                width: double.infinity,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 20,spreadRadius: 7)]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("the innovative platform presented as a solution for managing RED ZONES offers a "
                          "comprehensive approach to enhancing safety measures and community response.By providing"
                          "realtime insights,users can stay well-informed and make timely decisions,while direct"
                          "access to experts through an integrated chat application ensures personalzed guidance for "
                          "swift and informed responses. The platform emphasizes effortless accessibility,offering a "
                          "suite of services with a single click. it promotes data-driven decision-making by storing"
                          "and analyzing daily data, empowering decision-makers with valuable insights.Furthermore,alert"
                          "notifications are implemented to promptly inform both authorities and local residents ,fostering"
                          "quick and appropiate actions.The  platform prioritize enhanced security through secure data storage protocols,"
                          "safeguarding user details and sensitive information to upload privancy and security standards.")
                       ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
