import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            Container(
              height: 200,
              width: double.infinity,
              color: maincolor,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                    child: CustomText(
                        size: 18,
                        weight: FontWeight.w500,
                        color: customBalck,
                        text: 'Users')),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 212, 255, 214),
                        Color.fromARGB(255, 19, 153, 24),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: customGreen),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                    child: CustomText(
                        size: 18,
                        weight: FontWeight.w500,
                        color: customBalck,
                        text: 'Users')),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 212, 255, 214),
                        Color.fromARGB(255, 19, 153, 24),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: customGreen),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                    child: CustomText(
                        size: 18,
                        weight: FontWeight.w500,
                        color: customBalck,
                        text: 'Users')),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 212, 255, 214),
                        Color.fromARGB(255, 19, 153, 24),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: customGreen),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                    child: CustomText(
                        size: 18,
                        weight: FontWeight.w500,
                        color: customBalck,
                        text: 'Users')),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 212, 255, 214),
                        Color.fromARGB(255, 19, 153, 24),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: customGreen),
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.asset('assets/admin.json')),
            ],
          )
        ],
      ),
    );
  }
}
