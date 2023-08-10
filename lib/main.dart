import 'package:doctu/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp( const DoctorApp());
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'GeneralSans'
      ),
      debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
    );
  }
}