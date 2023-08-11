import 'package:doctu/Screens/Screen_components/home_inner.dart';
import 'package:doctu/Screens/Screen_components/profile.dart';
import 'package:doctu/Screens/functions/illness_prediction.dart';
import 'package:flutter/material.dart';
import '../Components/Home/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    const pages = <Widget>[HomeInner(), IllnessPrediction(), Profile()];
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF161616),
      body: Stack(
        children: [
          Positioned.fill(
            child: pages[_activeIndex],
          ),
          Positioned(
            left: width/20,
            right: width/20,
            bottom: width/20,
            child: BottomNavBar(
              activeIndex: _activeIndex,
              onTabTapped: (index) {
                setState(() {
                  _activeIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
