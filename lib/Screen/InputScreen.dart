import 'package:bmi_calculator/Screen/ResultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/CustomMeasurementWidget.dart';

class InputScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  int heightValue = 150;
  int ageValue = 25;
  int weightValue = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BMI CALCULATOR"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildListWheelScrollView(),
            SizedBox(height: 10),
            Text(
              'Height: $heightValue cm',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomMeasurementWidget(
                  title: 'Age',
                  value: ageValue,
                  onValueChanged: (newValue) {
                    setState(() {
                      ageValue = newValue;
                    });
                  },
                ),
                SizedBox(width: 100),
                CustomMeasurementWidget(
                  title: 'Weight',
                  value: weightValue,
                  onValueChanged: (newValue) {
                    setState(() {
                      weightValue = newValue;
                    });
                  },
                )
              ],
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen()));
            }, child: Text('Submit'))
          ],
        ),
      ),
    );
  }

  Widget buildListWheelScrollView() {
    return Container(
      height: 200,
      child: ListWheelScrollView(
        itemExtent: 70,
        diameterRatio: 1.5,
        offAxisFraction: 0.5,
        physics: FixedExtentScrollPhysics(),
        children: List.generate(
          251,
              (index) => Center(
            child: Text(
              '$index cm',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            heightValue = index;
          });
        },
      ),
    );
  }
}
