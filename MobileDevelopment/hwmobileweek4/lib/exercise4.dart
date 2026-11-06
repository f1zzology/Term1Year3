import 'package:flutter/material.dart';
class Exercise4 extends StatelessWidget {
  const Exercise4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 100),
        Container(height: 400, color: Colors.blue,),
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.green)),
              Container(width: 100, color: Colors.pink),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.amber)),
              SizedBox(width: 20),
              Expanded(child: Container(color: Colors.amber,)),
              SizedBox(width: 20),
              Expanded(child: Container(color: Colors.amber,)),
            ],
          ),
        ),

        const SizedBox(height: 20,),

        Expanded(child: Container(color: Colors.pink,)),




      ],
    ),
    );
  }
}
