import 'package:doctu/Screens/homepage.dart';
import 'package:flutter/material.dart';

class BuildContent extends StatelessWidget {
  final double width;
  const BuildContent({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Doctu",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Your personal health assistant, all your health issues' solution, get all your solutions by voice",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Center(child: Text("Go ahead")),
          ),
        ],
      ),
    );
  }
}
