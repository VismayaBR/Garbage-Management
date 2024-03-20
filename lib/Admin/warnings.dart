import 'package:flutter/material.dart';
import 'package:garbage_management/Admin/Recycle%20warning.dart';
import 'package:garbage_management/Admin/SendWarningDriver.dart';
import 'package:garbage_management/Controllers/AdminServices.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/AdNotificationCad.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/NotificationCard.dart';
import 'package:garbage_management/widgets/WarnigCard.dart';

class Warnings extends StatefulWidget {
  const Warnings({super.key});

  @override
  State<Warnings> createState() => _WarningsState();
}

class _WarningsState extends State<Warnings> {
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
                              print('object');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return SendWarning1();
                              }));
                              // Close the dialog
                              // Navigator.of(context).pop();
                            },
                            child: Text('Driver'),
                          ),
                          TextButton(
                            onPressed: () {
                              print('object');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return SendWarning2();
                              }));
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
                child: FutureBuilder(
                    future: warningData(),
                    builder: (context, snap) {
                      final users = snap.data?.docs ?? [];
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (ctx, index) {
                          var request =
                              users[index].data() as Map<String, dynamic>;
                          var id = users[index].id;
                          return Card(
                              child: ListTile(
                            tileColor: maincolor,
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        size: 15,
                                        weight: FontWeight.normal,
                                        color: customBalck,
                                        text: 'To : ${request['type']}' ??
                                            'Loading'),
                                    CustomText(
                                        size: 15,
                                        weight: FontWeight.normal,
                                        color: customBalck,
                                        text: 'Name : ${request['name']}' ??
                                            'Loading'),
                                    CustomText(
                                        size: 15,
                                        weight: FontWeight.normal,
                                        color: Colors.red,
                                        text: request['warning'] ?? 'Loading'),
                                  ]),
                            ),
                          ));
                        },
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
