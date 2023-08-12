import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildProfileComponent extends StatelessWidget {
  final IconData icon;
  final String title1;
  final String title2;
  final double width;
  final WidgetRef ref;

  const BuildProfileComponent({
    super.key,
    required this.icon,
    required this.title1,
    required this.title2,
    required this.ref,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final auth0 = Auth0(
      'dev-b5f32aepc3notpyh.us.auth0.com',
      'XZ9fMhdZpJ7QE3HmH2722wpTNwsAsUgP',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: const Color(0x20FFFFFF),
          borderRadius: BorderRadius.circular(width / 20),
        ),
        child: Padding(
          padding: EdgeInsets.all(width / 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      title2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
