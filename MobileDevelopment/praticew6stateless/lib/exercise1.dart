
import 'package:flutter/material.dart';
class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('My Hobbies')),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HobbyCard(
              title: 'Travelling',
              icon: Icons.travel_explore,
              color: Colors.green,
            ),
            SizedBox(height: 10),
            HobbyCard(
              title: 'Skating',
              icon: Icons.skateboarding,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String title;   // required
  final IconData icon;  // required
  final Color color;    // optional, default BLUE

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10), // the "button radius"
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
