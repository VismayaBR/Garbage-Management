import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    try {
      return await FirebaseFirestore.instance.collection('orders').get();
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails(String userId) async {
    try {
      return await FirebaseFirestore.instance.collection('users').doc(userId).get();
    } catch (e) {
      print('Error fetching user details: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final orders = snapshot.data!.docs;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final orderData = orders[index].data() as Map<String, dynamic>;
                final userId = orderData['user_Id'];
                return FutureBuilder(
                  future: getUserDetails(userId),
                  builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> userSnapshot) {
                    if (userSnapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text('Loading...'));
                    } else if (userSnapshot.hasError) {
                      return Text('Error: ${userSnapshot.error}');
                    } else {
                      final userData = userSnapshot.data!.data();
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: maincolor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18, bottom: 15, top: 28),
                                    child: CustomText(
                                      size: 15,
                                      weight: FontWeight.w500,
                                      color: customBalck,
                                      text: orderData['product'],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18, bottom: 15, top: 28),
                                    child: CustomText(
                                      size: 16,
                                      weight: FontWeight.w600,
                                      color: customBalck,
                                      text: 'Rs. ${orderData['price']}',
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.only(left: 18, bottom: 15, top: 10),
                                child: CustomText(
                                  size: 15,
                                  weight: FontWeight.normal,
                                  color: customBalck,
                                  text: '${userData!['username']}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18, bottom: 15),
                                child: CustomText(
                                  size: 15,
                                  weight: FontWeight.normal,
                                  color: customBalck,
                                  text: '${userData['address']}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18, bottom: 20),
                                child: CustomText(
                                  size: 15,
                                  weight: FontWeight.normal,
                                  color: customBalck,
                                  text: '${userData['phone']}',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18, bottom: 20),
                                    child: CustomText(
                                      size: 15,
                                      weight: FontWeight.normal,
                                      color: customBalck,
                                      text: '${orderData['date']}',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
