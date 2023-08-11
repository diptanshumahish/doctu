import 'package:doctu/Provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';

class HomeInner extends ConsumerWidget {
  const HomeInner({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final uref = ref.watch(userProvider);

    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Welcome",
              style: TextStyle(fontSize: 25),
            ),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(width / 20),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width / 15),
                    border: Border.all(color: Colors.black),
                    color: const Color(0xFF67DE90)),
                child: Padding(
                  padding: EdgeInsets.all(width / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(uref?.user.email ?? "Guest",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600)),
                      const Text("How are you feeling today? ",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 20, vertical: width / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width / 15),
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Stats",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Iconify(AntDesign.bell),
                              ],
                            ),
                            Text(
                              "Weight",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "80Kgs",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Height",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "140cm",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w600),
                            ),
                          ]),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: width / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width / 15),
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 229, 159, 239)),
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Iconify(
                            AntDesign.smile,
                            size: 50,
                          ),
                          Text(
                            "BMI",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "25.0",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 20, vertical: width / 30),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width / 15),
                    border: Border.all(color: Colors.black),
                    color: const Color.fromARGB(255, 229, 159, 239)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: Opacity(
                            opacity: 0.4,
                            child: Image.asset("Assets/Logo/health.png")),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Feeling ill?",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "Diagnose yourself with your personal medical assistant",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  "Diagnose now!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(width / 20),
              child: const Text(
                "Self improvement",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.all(width / 20),
                child: Stack(
                  children: [
                    Container(
                      height: height / 4,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width / 15),
                          image: const DecorationImage(
                              image: AssetImage("Assets/Blogs/blog.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Positioned.fill(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width / 15),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black],
                        ),
                      ),
                    )),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.all(width / 15),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Daily yoga helps you excel in life! ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "5 mins read ",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: height / 5,
            ),
          )
        ],
      ),
    );
  }
}
