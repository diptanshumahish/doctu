import 'package:flutter/material.dart';

class Diagnose extends StatelessWidget {
  final double width;
  const Diagnose({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: width / 30),
        child: Container(
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width / 15),
              border: Border.all(color: Colors.black),
              color: const Color.fromARGB(38, 255, 255, 255)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Opacity(
                      opacity: 0.4,
                      child: Image.asset("Assets/Logo/health.png")),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Feeling ill?",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "Diagnose yourself with your personal medical assistant",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            "Diagnose now!",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
