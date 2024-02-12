

import 'package:flutter/material.dart';
import 'package:mediped/home/bottomNavigationBar.dart';
import 'package:mediped/screen/News/news.dart';
import 'package:mediped/screen/predict/predict.dart';
import 'package:mediped/screen/ps/ps.dart';
import 'package:mediped/screen/team/team.dart';
import 'package:mediped/theme/color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                Stack(
                  children: [Container(
                    width: double.infinity,
                    height: 150,
                    child: Text(
                      "MEDIPED",
                      style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                  ),
                    Positioned(
                        top: 15,
                        right: 10,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.info),iconSize: 30,))
                  ],
                ),
                SizedBox(height: 70),

                Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [

                          ContainerButton(ImageName:"team",labelText: "TEAM",option: ()=>TeamPic()),
                          SizedBox(width: 5),
                          ContainerButton(ImageName:"ps",labelText: "PS",option: ()=>PS(),),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          ContainerButton(ImageName:"predict",labelText: "PREDICT", option: ()=>Predict()),
                          SizedBox(width: 5),
                          ContainerButton(ImageName:"news",labelText: "NEWS",option: ()=>News(),),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(height: 100,width: double.infinity),

              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBarWidget(
              currentPageIndex: currentPageIndex,
              onDestinationSelected: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final String? ImageName;
  final String? labelText;
  final Widget Function()? option;

  const ContainerButton({this.ImageName,this.option, this.labelText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Stack(
          children: [
            GestureDetector(onTap: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => option!() ),
            );},
              child: Container(
                height: 190, // Adjust height based on your image size
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/${ImageName}.png"),
                    scale: 2.3,
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8), // Adjust spacing between image and text
            Positioned(
              bottom: 0,
              left: 65,
              child: Text(
                labelText ?? "",
                style: TextStyle(
                  fontSize: 26, // Adjust font size as needed
                  fontWeight: FontWeight.bold, // Adjust font weight as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

