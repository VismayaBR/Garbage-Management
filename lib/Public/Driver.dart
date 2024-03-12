import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  var location;
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      location = spref.getString('location');
    });
  }

  Stream<QuerySnapshot> driverStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .where('location', isEqualTo: location)
        .where('type', isEqualTo: 'Driver')
        .snapshots();
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: StreamBuilder(
            stream: driverStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // or any loading indicator
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              var driverData = snapshot.data?.docs;

              // Extract driver details
              var driverDetails = driverData?.isNotEmpty ?? false
                  ? driverData![0].data() as Map<String, dynamic>
                  : null;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 150, child: Lottie.asset('assets/driver.json')),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 100,
                            child: Image.asset('assets/driver.png')),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                CustomText(
                                    size: 16,
                                    weight: FontWeight.normal,
                                    color: customBalck,
                                    text: 'Name'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 18,
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                CustomText(
                                    size: 16,
                                    weight: FontWeight.normal,
                                    color: customBalck,
                                    text: 'Email'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 18,
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                CustomText(
                                    size: 16,
                                    weight: FontWeight.normal,
                                    color: customBalck,
                                    text: 'Contact'),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                                left: 15,
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                      size: 16,
                                      weight: FontWeight.normal,
                                      color: customBalck,
                                      text: driverDetails?['username']),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                                left: 15,
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                      size: 16,
                                      weight: FontWeight.normal,
                                      color: customBalck,
                                      text: driverDetails?['email']),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                                left: 15,
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                      size: 16,
                                      weight: FontWeight.normal,
                                      color: customBalck,
                                      text: driverDetails?['phone']),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            size: 13,
                            weight: FontWeight.normal,
                            color: customGreen,
                            text: 'Call now'),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: customGreen,
                          ),
                          child: Center(
                              child: InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse('tel:${driverDetails?['phone']}'));
                            },
                            child: Icon(
                              Icons.call,
                              color: white,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Text('____Status____'),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: maincolor,
                        ),
                        child: Center(
                            child: CustomText(
                                size: 20,
                                weight: FontWeight.bold,
                                color: customBalck,
                                text: 'Pending'))),
                  )
                ],
              );
            }),
      ),
    );
  }
}
