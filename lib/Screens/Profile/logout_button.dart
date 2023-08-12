import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Provider/user_provider.dart';
import '../splash_screen.dart';

class LogoutButton extends StatelessWidget {
  final WidgetRef ref;
  final double width;
  const LogoutButton({super.key, required this.ref, required this.width});

  @override
  Widget build(BuildContext context) {
    final auth0 = Auth0(
      'dev-b5f32aepc3notpyh.us.auth0.com',
      'XZ9fMhdZpJ7QE3HmH2722wpTNwsAsUgP',
    );
    return InkWell(
      onTap: () async {
        await auth0.webAuthentication(scheme: "app").logout().then(
              (value) => ref.read(userProvider.notifier).deleteUser(),
            );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 20),
          color: Colors.white,
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
              Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
