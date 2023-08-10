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
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:const  Color(0xFF161616), // Improved background color
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width / 20),
        child: BottomNavBar(
          activeIndex: _activeIndex,
          onTabTapped: (index) {
            setState(() {
              _activeIndex = index;
            });
          },
        ),
      ),
    );
  }

  
}
