import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   // final height=TextEditingController();
   TextEditingController height = TextEditingController();
   int heightValue = 150;
   @override
   void dispose() {
     height.dispose();
     super.dispose();
   }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Container(
        height: 200,
        width: 400,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30)
        ),
        child:Center(
          child: Column(
            children: [
              Text('HEIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Text(
                '$heightValue cm ',
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30),
              ),
              SliderTheme(data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.deepPurple,
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.black
              ),child: Slider(
                  min: 100,max: 250,
                  value: heightValue.toDouble(),
                  divisions: 150,
                  onChanged: (value){
                    setState(() {
                      heightValue=value.toInt();
                      height.text=value.round().toString();
                    });
                  })
              ),
            ],
          ),
        ) ,
      )
    );
  }
}
