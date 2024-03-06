import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/UserCard.dart';

class Degradable extends StatefulWidget {
  const Degradable({super.key});

  @override
  State<Degradable> createState() => _DegradableState();
}

class _DegradableState extends State<Degradable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: maincolor,
        title: CustomText(
          text: "Degradable",
          weight: FontWeight.w400,
          size: 20,
          color: customBalck
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: 
            ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return UserCard(
                  name: 'qwerty',
                  address: 'qewrtyu',
                  phone: '1234567890',
                  
                );
              },
            )
      )
    );
  }
}