import 'package:flutter/material.dart';
import 'package:garbage_management/Public/PublicNavbar.dart';
import 'package:lottie/lottie.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  void initState() {
    super.initState();

    // Add a delay of 2 seconds before navigating to the next page
    Future.delayed(Duration(seconds: 2), () {
      // Push the next page onto the navigation stack
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => PublicNav(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/ordered.json'),
      ),
    );
  }
}
