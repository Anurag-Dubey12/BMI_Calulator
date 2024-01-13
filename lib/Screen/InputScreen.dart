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
  double bmiResult = 0.0;
  String bmiCategory = '';
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
            Text(
              'Height: $heightValue cm',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            buildListWheelScrollView(),
            SizedBox(height: 10),
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
            SizedBox(height: 10),
            Container(
              width: 400,
              child: ElevatedButton(onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen()));
                calculatebmi();
              }, style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states){
                      if(states.contains(MaterialState.pressed)){
                        return Colors.grey;
                      }
                      if(states.contains(MaterialState.hovered)){
                        return Colors.cyanAccent;
                      }
                      return Colors.lightBlue;
                    }
                )
              ),
                child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              )
            ),
            SizedBox(height: 16),
            Text('BMI Result: ${bmiResult.toStringAsFixed(2)}',style: TextStyle(fontSize: 24),),
            Text('Category: $bmiCategory'),
          ],
        ),
      ),
    );
  }
  void calculatebmi(){
    if(heightValue>0 && weightValue>0 && ageValue>0){
      setState(() {
        double heightInMeters= heightValue/100.0;
        bmiResult=weightValue/(heightInMeters*heightInMeters);
        bmiCategory=getbmicategory(bmiResult,ageValue);
      });
    }
    else {
      setState(() {
        bmiResult = 0.0;
        bmiCategory = '';
      });
    }
  }
  String getbmicategory(double bmi,int age){
    if (age < 18) {
      return 'BMI categories for children may differ';
    }
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else if (bmi < 35) {
      return 'Obesity I';
    } else if (bmi < 40) {
      return 'Obesity II';
    } else {
      return 'Obesity III';
    }
  }
  Widget buildListWheelScrollView() {
    return Container(
      height: 200,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 70,
        diameterRatio: 1.5,
        offAxisFraction: 0.5,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (BuildContext context, int index) {
            return Center(
              child: Text(
                '$index cm',
                style: TextStyle(
                  fontSize: 18,
                  color: index == heightValue ? Colors.red : Colors.black,
                ),
              ),
            );
          },
          childCount: 251,
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
