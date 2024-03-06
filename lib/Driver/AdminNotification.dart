import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/AdNotificationCad.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/NotificationCard.dart';

class AdminNotification extends StatelessWidget {
  const AdminNotification({super.key});

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
            text: "Warnings",
            weight: FontWeight.w400,
            size: 20,
            color: customBalck),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  showDialog(
            context: context,
            builder: (BuildContext context) {
              // Your custom dialog content goes here
              return AlertDialog(
                title: Text('Send Warning to'),
               
                actions: [
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Driver'),
                  ),
                   TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Recycling team'),
                  ),
                ],
              );
            },
          );

                },
                child: Icon(Icons.add),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return AdNotifiactionCard(
                        title: 'title',
                        time: '1.00 pm',
                        date: '12/02/2024',
                        content:
                            'AdminNotification content shown here...' // Add the actual date field if available
                        );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
