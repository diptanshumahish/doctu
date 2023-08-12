import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  final String name;
  final double width;
  const NameCard({super.key, required this.name, required this.width});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(width / 20),
        child: Container(
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width / 15),
              border: Border.all(color: Colors.black),
              color: const Color.fromARGB(111, 63, 63, 63)),
          child: Padding(
            padding: EdgeInsets.all(width / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                const Text("How are you feeling today? ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
