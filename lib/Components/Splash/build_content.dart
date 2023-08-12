import 'package:doctu/Screens/Auth/login_page.dart';
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
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width / 20),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Let's Go",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.emoji_emotions)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
