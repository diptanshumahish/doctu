import 'package:flutter/material.dart';

class AnimatedBlob extends StatelessWidget {
  final double width;
  final double height;
  const AnimatedBlob({super.key,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
     return AnimatedPositioned(
      duration: const Duration(seconds: 3),
      left: -width/5, // Initial position
      right:0, // Move to the right
      top: 0,
      bottom: 0,
      curve: Curves.fastOutSlowIn,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/backgrounds/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}