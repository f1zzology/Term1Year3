import 'package:flutter/material.dart';
import 'exercise1.dart';
import 'exercise2.dart';
import 'exercise3.dart';
import 'exercise4.dart';
import 'exercise5.dart';
void main() => runApp(const MyApp());
const int activeExercise = 3 ;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: switch (activeExercise) {
        0 => const Exercise1(),
        1 => const Exercise2(),
        2 => const Exercise3(),
        3 => const Exercise4(),
        _ => const Exercise5(),
      },
    );
  }
}
