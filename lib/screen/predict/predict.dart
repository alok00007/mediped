import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mediped/theme/color.dart';

class Predict extends StatefulWidget {
  @override
  _PredictState createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  final TextEditingController feature2Controller = TextEditingController();
  final TextEditingController feature3Controller = TextEditingController();
  final TextEditingController feature4Controller = TextEditingController();
  final TextEditingController feature5Controller = TextEditingController();
  final TextEditingController feature6Controller = TextEditingController();
  bool isTemp=false;
  bool isPredict=false;
  String prediction = '';
  String probability = '';
  String noOfCases = '';
  String category = '';

  List<String> mosquitoOptions = [
    "aedes",
    "anopheles",
    "aegypti",
  ];


  Future<void> predictCases() async {
    print("pridicting function is started");
    var url = Uri.parse('http://192.168.0.238:5000/predict_from_flutter');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'feature2': feature2Controller.text,
        'feature3': feature3Controller.text,
        'feature4': feature4Controller.text,
        'feature5': feature5Controller.text,
        'feature6': feature6Controller.text,
      }),
    );

    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print("Successfully passed");
      var decodedResponse = jsonDecode(response.body);
      setState(() {
        prediction = decodedResponse['prediction'].toString();
        probability = decodedResponse['probability'].toString();
        noOfCases = decodedResponse['no_of_cases'].toString();
        category = decodedResponse['category'].toString();
      });
    } else {
      setState(() {
        prediction = 'Failed to get prediction.';
        probability = '';
        noOfCases = '';
        category = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: backgroundScreen,

      body: Container(
        decoration: BoxDecoration(gradient: gradientColor),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
                Text('Predict Disease',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: textColor)),
                SizedBox(height: 50),
                TextField(
                  controller: feature2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Rainfall(0-500mm)',
                    hintStyle: TextStyle(color: textColor),labelStyle: TextStyle(color: textColor),
                    border: OutlineInputBorder(),prefixIcon: Icon(Icons.water),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20.0)),),
                  style: TextStyle(color: textColor),
                ),SizedBox(height: 10),
            
                TextField(
                  controller: feature3Controller,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(labelText: 'Temperature (0-60^C)',border: OutlineInputBorder(),prefixIcon: Icon(Icons.water),
                    hintStyle: TextStyle(color: textColor),labelStyle: TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20.0)),),
                  style: TextStyle(color: textColor),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: feature4Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Avg Relative Humidity (15-80)',border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.foggy),
                    hintStyle: TextStyle(color: textColor),labelStyle: TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20.0)),),
                    style: TextStyle(color: textColor),
                ),SizedBox(height: 10),
                TextField(
                  controller: feature5Controller,
            
                  decoration: InputDecoration(labelText: 'State( write correct name)',border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.area_chart),
                    hintStyle: TextStyle(color: textColor),labelStyle: TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20.0)),
                  ),style: TextStyle(color: textColor),
                ),SizedBox(height: 10),
                TextField(
                  controller: feature6Controller,
                  decoration: InputDecoration(labelText: 'Mosquito( aedes/anopheles/aegypti)',border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.night_shelter),
                    hintStyle: TextStyle(color: textColor),labelStyle: TextStyle(color: textColor),

                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20.0)),),
                  style: TextStyle(color: textColor),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed:(){
                    /*double.parse(feature2Controller.text.toString()) > 500 ?  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("please give rainfall within 500mm"))):isTemp=true ;;
                    double.parse(feature3Controller.text.toString()) > 60 ?  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("please give temperature within 60^C"))):isTemp=true ;;
                    //double.parse(feature4Controller.text.toString()) > 80 ?  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("please give avg Humidity within 15-80"))):isTemp=true ;;
                    */
                   /* isTemp==false ? predictCases():Container();
                    setState(() {
                      isPredict=isTemp;
                      isTemp=false;
                    });*/
                    predictCases();
                    }, //predictCases,
                  child: Text('Predict Cases'),
                ),
                SizedBox(height: 10),
                 Column(
                  children: [
                    Text('Prediction: $prediction',style: TextStyle(color: textColor),),
                    Text('Probability: $probability',style: TextStyle(color: textColor),),
                    Text('Number of Cases: $noOfCases',style: TextStyle(color: textColor),),
                    Text('Category: $category',style: TextStyle(color: textColor),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

