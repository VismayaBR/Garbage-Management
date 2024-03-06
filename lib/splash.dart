import 'package:flutter/material.dart';
import 'package:garbage_management/Login.dart';
import 'package:garbage_management/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   gotoLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 160,
          height: 160,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>Login(),
        ));
  }
}
