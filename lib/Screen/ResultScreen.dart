
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ResultScreenState();

}
class ResultScreenState extends State<ResultScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BMI CALCULATOR"),
      ),
      body: Container(

      ),
    );
  }

}