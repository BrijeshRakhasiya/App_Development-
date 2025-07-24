import 'dart:io';

void main() {
  // stdout.write("Enter N01 :- ");
  // var a = stdin.readLineSync();
  // print("A value is :- $a");
  // stdout.write("Enter no2:- ");
  // var b = stdin.readLineSync();
  // print("B value is :- $b");
  // var c = int.parse(a!) + int.parse(b!);
  // print("SUM is :- $c");

  // if (c == 30) {
  //   print("C is 30");
  // } else if (c > 30) {
  //   print("C is > 30");
  // } else {
  //   print("c is < 30");
  // }

  // stdout.write("Enter 5 Numbers:-");
  // var no1 = stdin.readLineSync();
  // var no2 = stdin.readLineSync();
  // var no3 = stdin.readLineSync();
  // var no4 = stdin.readLineSync();
  // var no5 = stdin.readLineSync();

  // var sum =
  //     int.parse(no1!) +
  //     int.parse(no2!) +
  //     int.parse(no3!) +
  //     int.parse(no4!) +
  //     int.parse(no5!);

  // print("SUM is :- $sum");

  // dynamic avg = sum / 5;
  // print("Average := $avg");

  // if (avg > 90) {
  //   print("A grade");
  // } else if (avg < 90 && avg >= 80) {
  //   print("B grade");
  // } else if (avg < 80 && avg >= 70) {
  //   print("C Grade");
  // } else if (avg < 70 && avg >= 60) {
  //   print("D grade ");
  // } else {
  //   print("Fail");
  // }

  List<dynamic> myList = [];

  for (int i = 0; i < 5; i++) {
    stdout.write('Enter item ${i + 1}: ');
    var input = stdin.readLineSync();

    myList.add(input);
  }

  print('Your list: $myList');

  print("1.Sort List");
  print("2.Empty List");
  print("3.Insert at idx in List");
  print("4.Add number in List");
  print("5.Reverse  List");

  stdout.write("Enter Number :- ");
  var a = stdin.readLineSync();

  if (a == 1) {
    myList.sort();
    print('Your list: $myList');
  } else if (a == 2) {
    myList.clear();
    print('Your list: $myList');
  } else if (a == 3) {
    stdout.write("Enter insert idx and Number :-");
    var idx = stdin.readLineSync();
    var num = stdin.readLineSync();
    myList.insert(int.parse(idx!), num!);
    print('Your list: $myList');
  } else if (a == 4) {
    stdout.write("Enter insert Number :-");
    var num = stdin.readLineSync();
    myList.add(num);
    print('Your list: $myList');
  } else if (a == 5) {
    stdout.write("Enter insert idx there remove  :-");
    var idx = stdin.readLineSync();
    myList.removeAt(int.parse(idx!));
    print('Your list: $myList');
  }
}
