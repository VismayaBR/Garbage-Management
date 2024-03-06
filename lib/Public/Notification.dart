
import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/NotificationCard.dart';


class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: customBalck,
            ),
          ),
        ),
        backgroundColor: maincolor,
        title: CustomText(
          text: "Notifications",
          weight: FontWeight.w400,
          size: 20,
          color: customBalck
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: 
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return NotifiactionCard(
                  title: 'title',
                  time: '1.00 pm',
                  date: '12/02/2024',
                  content:'Notifications content shown here...' // Add the actual date field if available
                );
              },
            )
      )
    );
  }
}