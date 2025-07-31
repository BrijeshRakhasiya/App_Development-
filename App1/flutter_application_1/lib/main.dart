import 'package:flutter/material.dart';
import 'counter.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  var msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ), // AppBar
      body: Center(
        child: Column(
          children: [
            const Text('Sum App'),
            TextField(controller: txt1),
            TextField(controller: txt2),
            ElevatedButton(
              onPressed: () {
                doSum();
              },
              child: Text("Submit"),
            ), // ElevatedButton
            Text("$msg"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counter()),
                );
              },
              child: Text("Go to Counter"),
            ), // ElevatedButton
          ],
        ), // Column
      ), // Center
    ); // Scaffold
  }

  void doValidation() {
    var no1 = txt1.text;
    var no2 = txt2.text;
    if (no1.isEmpty || no2.isEmpty) {
      setState(() {
        msg = "Please enter both numbers";
      });
      return;
    }
    if (int.tryParse(no1) == null || int.tryParse(no2) == null) {
      setState(() {
        msg = "Please enter valid numbers";
      });
      return;
    }
  }

  void doSum() {
    doValidation();
    if (msg.isNotEmpty) {
      return;
    }
    var no1 = txt1.text;
    var no2 = txt2.text;
    var c = int.parse(no1) + int.parse(no2);
    print("Sum is $c");
    setState(() {
      msg = "Sum is $c";
    });
  }
}