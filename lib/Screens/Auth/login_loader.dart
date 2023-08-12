import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Provider/user_provider.dart';
import '../homepage.dart';

class Loader extends ConsumerWidget {
  final Credentials cred;
  const Loader({super.key, required this.cred});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final uref = ref.watch(userProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateAndNavigate(context, ref);
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _updateAndNavigate(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).updateUser(cred);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
