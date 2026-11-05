import 'package:flutter/material.dart';

class Exercise2 extends StatelessWidget {
  const Exercise2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(40),
          color: Colors.blue[300],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text("CADT STUDENTS", style: TextStyle(color: Colors.white),),
          ),
        ),
        ),
      )
    );
  }
}
