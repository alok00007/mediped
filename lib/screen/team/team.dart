import 'package:flutter/material.dart';
import 'package:mediped/theme/color.dart';

class TeamPic extends StatelessWidget {
  const TeamPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradientColor),
        child: Column(

          children: [
            SizedBox(height: 50),
            Row(

              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/images/back.png",
                    scale:7,
                    color: textColor,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                Text(
                  "TEAM",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60), // Adjust the spacing as needed
            Expanded(
              child: ListView(
                children: [
                  TeamCard(name: "ABHISHEK"),
                  SizedBox(height: 10),
                  TeamCard(name: "AKASH"),
                  SizedBox(height: 10),
                  TeamCard(name: "ALOK"),
                  SizedBox(height: 10),
                  TeamCard(name: "AYUSH"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String? name;
  const TeamCard({this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(boxShadow:[BoxShadow(color: Colors.white,blurRadius:6,spreadRadius: 0.5)] ),
      child: Card(
        color: backgroundContainer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/images/team/man1.jpg",
                  height: MediaQuery.of(context).size.width * 0.28,
                  width: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              Text(
                "$name",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
