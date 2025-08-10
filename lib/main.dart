import 'package:flutter/material.dart';
import 'package:task/list_view_page.dart';
import 'package:task/sum_algorithm.dart';

void main() {
  final nums = [-1, 0, 1, 2, -1, -4];
  final triplets = threeSum(nums);
  print(triplets);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListViewPage(),
    );
  }
}
