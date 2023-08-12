import 'package:doctu/Provider/user_provider.dart';
import 'package:doctu/Screens/Auth/login_page.dart';
import 'package:doctu/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildContent extends StatelessWidget {
  final double width;
  final WidgetRef ref;
  const BuildContent({super.key, required this.width, required this.ref});

  @override
  Widget build(BuildContext context) {
    final tref = ref.read(userProvider)?.idToken;
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
            onTap: () async {
              if (tref == null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }
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
