import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:lottie/lottie.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150, child: Lottie.asset('assets/driver.json')),
            Padding(
              padding: const EdgeInsets.only(left: 18,right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 100, child: Image.asset('assets/driver.png')),
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
                  CustomText(size: 13, weight: FontWeight.normal, color: customGreen, text: 'Call now'),
                   SizedBox(width: 10,),
                   Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: customGreen,
                              ),
                              child: Center(child: Icon(Icons.call,color: white,)),
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: maincolor,),
               child: Center(child: CustomText(size: 20, weight: FontWeight.bold, color: customBalck, text: 'Pending'))
               ),
             )
          ],
        ),
      ),
    );
  }
}
