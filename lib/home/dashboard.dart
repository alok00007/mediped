

import 'package:flutter/material.dart';
import 'package:mediped/home/bottomNavigationBar.dart';
import 'package:mediped/screen/3d%20rotatiing%20cube/rotating_cube.dart';
import 'package:mediped/screen/News/news.dart';
import 'package:mediped/screen/predict/predict.dart';
import 'package:mediped/screen/ps/info.dart';
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
      body: Container(decoration: BoxDecoration(gradient:gradientColor),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width*0.1),
                Stack(
                  children: [Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width*0.56,
                    child: Row(
                      children: [
                        Text(
                          "MED",
                          style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold,color: textColor),
                        ),
                        Text(
                          "i",
                          style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold,color: Colors.red),
                        ),
                        Text(
                          "PED",
                          style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold,color: textColor),
                        ),
                      ],
                    ),
                  ),
                    Positioned(
                        top: 55,
                        right: 20,
                        child: IconButton(onPressed: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => info() ), //RotatingCubeApp()
                          );
                        }, icon: Icon(Icons.info),iconSize: 30,color: Colors.white,))
                  ],
                ),
                SizedBox(height: 100),

                Positioned(
                  bottom: 0,
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(

                      color: backgroundContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [

                            ContainerButton(ImageName:"team",labelText: "TEAM",option: ()=>TeamPic()),
                            SizedBox(width: MediaQuery.of(context).size.width*0.008),
                            ContainerButton(ImageName:"ps",labelText: "PS",option: ()=>PS(),),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            ContainerButton(ImageName:"predict",labelText: "PREDICT", option: ()=>Predict()),
                            SizedBox(width: MediaQuery.of(context).size.width*0.007),
                            ContainerButton(ImageName:"news",labelText: "NEWS",option: ()=>News(),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


              ],
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
      ));
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
                height: MediaQuery.of(context).size.width*0.45,
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
            SizedBox(height: 10),
            Positioned(
              bottom: 0,
              left: 40,
              child: Text(
                labelText ?? "",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

