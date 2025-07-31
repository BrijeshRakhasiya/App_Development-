import 'package:flutter/material.dart';
import 'counter.dart';
import 'login_page.dart';

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
      home: const LoginPage(), // Start with login page
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
        actions: [
          IconButton(
            onPressed: () {
              // Logout and go back to login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ), // AppBar
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sum App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: txt1,
                decoration: const InputDecoration(
                  labelText: 'First Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: txt2,
                decoration: const InputDecoration(
                  labelText: 'Second Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  doSum();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  "Calculate Sum",
                  style: TextStyle(color: Colors.white),
                ),
              ), // ElevatedButton
              const SizedBox(height: 20),
              if (msg.isNotEmpty)
                Text(
                  msg,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Counter()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  "Go to Counter",
                  style: TextStyle(color: Colors.white),
                ),
              ), // ElevatedButton
            ],
          ),
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
    // Clear message if validation passes
    setState(() {
      msg = "";
    });
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
