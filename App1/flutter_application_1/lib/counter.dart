import 'package:flutter/material.dart';
import 'whatsapp.dart';


class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  var msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Counter"), backgroundColor: Colors.red),
      body: Column(
        children: [
          Text("Hello World", style: TextStyle(fontSize: 30)),
          TextField(
            onChanged: (value) {
              checkEvenOdd(int.parse(value));
            },
          ),
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
          Text(msg, style: TextStyle(fontSize: 20, color: Colors.red)),
          ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdPage()),
            );
          },
          child: Text("Go to WhatsApp Page"),
        ),
        ],
      ),
    );
  }

  void incrementCounter() {
    if (counter < 5) {
      setState(() {
        counter++;
        msg = "";
      });
    } else {
      setState(() {
        msg = "Sorry, the counter cannot exceed 5.";
      });
    }
  }

  void decrementCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
        msg = "";
      });
    } else {
      setState(() {
        msg = "Counter cannot be less than 0.";
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void checkEvenOdd(value) {
    if (value % 2 == 0) {
      setState(() {
        msg = "The number is even.";
      });
    } else {
      setState(() {
        msg = "The number is odd.";
      });
    }
  }
}
