import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:doctu/Provider/height_weight_provider.dart';
import 'package:doctu/Screens/Auth/data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Provider/user_provider.dart';
import '../homepage.dart';

class Loader extends ConsumerWidget {
  final Credentials cred;
  const Loader({super.key, required this.cred});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uref = ref.watch(userDataProvider)?.height;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateAndNavigate(context, ref, uref);
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _updateAndNavigate(BuildContext context, WidgetRef ref, String? uref) {
    ref.read(userProvider.notifier).updateUser(cred);
    if (uref == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => UpdateHeightWeight(
                  name: cred.user.name!,
                  tokenId: cred.idToken,
                )),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
}
