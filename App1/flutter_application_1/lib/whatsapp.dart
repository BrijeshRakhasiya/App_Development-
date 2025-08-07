import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  final List<String> mylist = const [
    "C",
    "C++",
    "Java",
    "JS",
    "Python",
    "Rust",
    "Swift",
    "Dart",
    "React"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Screen')),
      body: ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              // leading: Image.asset("assets/image/images.png"),
              leading: CircleAvatar(child: Text("indx"),),
              title: Text(mylist[index]),
              subtitle: const Text("Coming Soon"),
            ),
          );
        },
      ),
    );
  }
}