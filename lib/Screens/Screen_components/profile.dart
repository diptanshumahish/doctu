import 'package:doctu/Provider/height_weight_provider.dart';
import 'package:doctu/Screens/Profile/build_profile_compoenent.dart';
import 'package:doctu/Screens/Profile/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;

    final pref = ref.read(userDataProvider);

    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "Assets/backgrounds/splash.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width / 20),
            child: ListView(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                BuildProfileComponent(
                    icon: Icons.document_scanner_rounded,
                    title1: "get your",
                    title2: "Prescriptions",
                    ref: ref,
                    width: width),
                BuildProfileComponent(
                    icon: Icons.account_circle,
                    title1: "Full name",
                    title2: pref?.name ?? "Unknown ",
                    ref: ref,
                    width: width),
                BuildProfileComponent(
                    icon: Icons.scale,
                    title1: "Weight",
                    title2: pref?.weight ?? "0",
                    ref: ref,
                    width: width),
                BuildProfileComponent(
                    icon: Icons.height,
                    title1: "Height",
                    title2: pref?.height ?? "unset",
                    ref: ref,
                    width: width),
                const SizedBox(
                  height: 20,
                ),
                LogoutButton(ref: ref, width: width)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
