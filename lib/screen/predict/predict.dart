import 'dart:convert'; // Add this import statement

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlowerClassification extends StatefulWidget {
  @override
  _FlowerClassificationState createState() => _FlowerClassificationState();
}

class _FlowerClassificationState extends State<FlowerClassification> {
  final TextEditingController sepalLengthController = TextEditingController();
  final TextEditingController sepalWidthController = TextEditingController();
  final TextEditingController petalLengthController = TextEditingController();
  final TextEditingController petalWidthController = TextEditingController();

  String prediction = '';

  Future<void> predictFlower() async {
    var url = Uri.parse('http://127.0.0.1:5000/predict');
    var response = await http.post(url, body: {
      'Sepal_Length': sepalLengthController.text,
      'Sepal_Width': sepalWidthController.text,
      'Petal_Length': petalLengthController.text,
      'Petal_Width': petalWidthController.text,
    });

    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print("sucessfully passed");
      var decodedResponse = jsonDecode(response.body);
      setState(() {
        prediction = decodedResponse['prediction'];
        print("prediction is:$prediction");
      });
    } else {
      setState(() {
        prediction = 'Failed to get prediction.';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower Classification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: sepalLengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sepal Length'),
            ),
            TextField(
              controller: sepalWidthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sepal Width'),
            ),
            TextField(
              controller: petalLengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Petal Length'),
            ),
            TextField(
              controller: petalWidthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Petal Width'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: predictFlower,
              child: Text('Predict'),
            ),
            SizedBox(height: 20),
            Text('Prediction: $prediction'),
          ],
        ),
      ),
    );
  }
}
