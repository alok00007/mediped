import 'package:flutter/material.dart';
import 'package:mediped/theme/color.dart';

class PS extends StatelessWidget {
  const PS({super.key});

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
              Text("PROBLEM STATEMENT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),


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
                          Text("We have to create a system that predicts the likelihood of diseases like dengue and leptospirosis spreading.To do this,we'll use"
                              " different measures related to disease carriers(vectors),keep track of daily disease reports,and consider factors like rainfall and the environment."
                              "The goal is to identify areas that are more prone to disease outbreaks,known as "
                              "hotspots,to better prepare and prevent the spread of these diseases. ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)
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
