import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Public/PublicNavbar.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/AdNotificationCad.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';
import 'package:garbage_management/widgets/NotificationCard.dart';
import 'package:intl/intl.dart';

class SendNotification extends StatelessWidget {
  SendNotification({super.key});
  var title = TextEditingController();
  var content = TextEditingController();
  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('notifications')
              .get();

      print('Firestore Data: ${querySnapshot.docs}');

      return querySnapshot;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the exception to be caught by the FutureBuilder
    }
  }

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
                        title: Text('Send Message'),
                        actions: [
                          CustomTextField(
                            label: 'title',
                            controller: title,
                            size: 13,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter title';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            label: 'cintent',
                            controller: content,
                            size: 13,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter description';
                              }
                              return null;
                            },
                          ),
                          TextButton(
                            onPressed: () {
                              String dt1 = DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now());

                              FirebaseFirestore.instance
                                  .collection('notifications')
                                  .add({
                                'title': title.text,
                                'description': content.text,
                                'date': dt1
                              });
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                                return PublicNav();

                              }));
                            },
                            child: Text('Send'),
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
                    future: getData(),
                    builder: (context, snap) {
                      final notification = snap.data?.docs ?? [];
                      return ListView.builder(
                        itemCount: notification.length,
                        itemBuilder: (ctx, index) {
                          var notifications = notification[index].data()
                              as Map<String, dynamic>;
                          var id = notification[index].id;
                          return AdNotifiactionCard(
                              title: notifications['title'],
                              time: '',
                              date: notifications['date'],
                              content:
                                 notifications['description'] // Add the actual date field if available
                              );
                        },
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
