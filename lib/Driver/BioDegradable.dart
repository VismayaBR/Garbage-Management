import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/UserCard.dart';

class BioDegradable extends StatefulWidget {
  const BioDegradable({super.key});

  @override
  State<BioDegradable> createState() => _BioDegradableState();
}

class _BioDegradableState extends State<BioDegradable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: maincolor,
        title: CustomText(
          text: "BioDegradable",
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