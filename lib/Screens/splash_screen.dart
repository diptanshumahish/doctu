import 'package:doctu/Components/Splash/animated_blob.dart';
import 'package:doctu/Components/Splash/build_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedBlob(width: width, height: height),
          BuildContent(
            width: width,
            ref: ref,
          ),
        ],
      ),
    );
  }
}
