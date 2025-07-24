import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  String mymsg = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My App"), backgroundColor: Colors.yellow),
        body: Column(
          children: [
            Text("Hello World", style: TextStyle(fontSize: 30)),
            Text("Counter Value is $counter", style: TextStyle(fontSize: 40)),
            ElevatedButton(
              onPressed: () {
                incrementCounter();
              },
              child: Text("+"),
            ),
            OutlinedButton(
              onPressed: () {
                decrementCounter();
              },
              child: Text("-"),
            ),
            IconButton(
              onPressed: () {
                resetCounter();
              },
              icon: Icon(Icons.delete, size: 40),
            ),
            Text(" $mymsg"),
            TextField(
              onChanged: (value) {
                setState(() {
                 
                  mymsg = value;
                  checkOddEven();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void incrementCounter() {
    setState(() {
      if (counter > 5) {
        mymsg = "Counter can't go above 5";
      } else {
        counter++;
        mymsg = "";
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
        mymsg = "";
      } else {
        counter = 0;
        mymsg = "Counter can't go below 0";
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void checkOddEven() {
    int a = int.parse(mymsg);
    if (a % 2 == 0) {
      mymsg = "Even";
    } else {
      mymsg = "odd";
    }
  
}
