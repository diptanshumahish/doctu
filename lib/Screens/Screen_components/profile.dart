import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:doctu/Provider/user_provider.dart';
import 'package:doctu/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0 = Auth0('dev-b5f32aepc3notpyh.us.auth0.com',
        'XZ9fMhdZpJ7QE3HmH2722wpTNwsAsUgP');
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () async {
                await auth0.webAuthentication(scheme: "app").logout().then(
                    (value) => ref.read(userProvider.notifier).deleteUser());

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
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
