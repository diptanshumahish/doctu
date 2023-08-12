import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:doctu/Provider/user_provider.dart';
import 'package:doctu/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    final auth0 = Auth0('dev-b5f32aepc3notpyh.us.auth0.com',
        'XZ9fMhdZpJ7QE3HmH2722wpTNwsAsUgP');
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "Assets/backgrounds/splash.png",
            fit: BoxFit.cover,
          )),
          Padding(
            padding: EdgeInsets.all(width / 20),
            child: ListView(
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0x20FFFFFF),
                        borderRadius: BorderRadius.circular(width / 20)),
                    child: Padding(
                      padding: EdgeInsets.all(width / 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "get your",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Prescriptions",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(
                            Icons.document_scanner_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0x20FFFFFF),
                        borderRadius: BorderRadius.circular(width / 20)),
                    child: Padding(
                      padding: EdgeInsets.all(width / 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full name",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Diptanshu Mahish",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0x20FFFFFF),
                        borderRadius: BorderRadius.circular(width / 20)),
                    child: Padding(
                      padding: EdgeInsets.all(width / 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "80 Kgs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(
                            Icons.scale,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0x20FFFFFF),
                        borderRadius: BorderRadius.circular(width / 20)),
                    child: Padding(
                      padding: EdgeInsets.all(width / 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "180cms",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(
                            Icons.height,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await auth0.webAuthentication(scheme: "app").logout().then(
                        (value) =>
                            ref.read(userProvider.notifier).deleteUser());

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()));
                  },
                  child: Container(
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
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width / 20),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
