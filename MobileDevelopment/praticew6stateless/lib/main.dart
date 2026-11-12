import 'package:flutter/material.dart';
import 'package:praticew6stateless/exercise1.dart';
import 'package:praticew6stateless/exercise2.dart';
import 'package:praticew6stateless/exercise3.dart';


// import 'exercise1.dart';
// import 'exercise3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Exercise3(),
    );
  }
}
