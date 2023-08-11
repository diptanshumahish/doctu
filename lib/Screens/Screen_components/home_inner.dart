import 'package:doctu/Components/Home/Home_inner/diagnose.dart';
import 'package:doctu/Components/Home/Home_inner/name.dart';
import 'package:doctu/Components/Home/Home_inner/stats.dart';
import 'package:doctu/Provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          NameCard(name: uref?.user.name ?? "Guest", width: width),
          Stats(height: 150, weight: 80, width: width),
          Diagnose(width: width),
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
