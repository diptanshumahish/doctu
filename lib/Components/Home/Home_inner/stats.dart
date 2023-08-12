import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';

class Stats extends StatelessWidget {
  final String weight;
  final String height;
  final double width;
  const Stats(
      {super.key,
      required this.height,
      required this.weight,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: width / 30),
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
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Stats",
                            style: TextStyle(fontSize: 20),
                          ),
                          Iconify(AntDesign.bell),
                        ],
                      ),
                      const Text(
                        "Weight",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${weight}Kgs",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${height}cm",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
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
                  color: const Color.fromARGB(56, 119, 118, 119)),
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Iconify(
                      AntDesign.smile,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text(
                      "BMI",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "25.0",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
