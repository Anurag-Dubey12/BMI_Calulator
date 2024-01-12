import 'package:flutter/material.dart';

class CustomMeasurementWidget extends StatelessWidget {
  final String title;
  final int value;
  final ValueChanged<int>? onValueChanged;

  CustomMeasurementWidget({
    required this.title,
    required this.value,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.black87,
            width: 5.0,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignInside
          )
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            '$value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (onValueChanged != null) {
                    onValueChanged!(value - 1);
                  }
                },

                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  if (onValueChanged != null) {
                    onValueChanged!(value + 1);
                  }
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
