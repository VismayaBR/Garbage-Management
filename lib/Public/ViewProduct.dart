import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Public/OrderPage.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class ViewProduct extends StatefulWidget {
  String product;
  String price;
  String desc;
  var image;
  ViewProduct(
      {Key? key,
      required this.product,
      required this.price,
      required this.desc,
      required this.image})
      : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  void initState() {
    pro();
  }

  pro() {
    print(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo.png', height: 50),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    widget.image, fit: BoxFit.cover,
                    // Adjust the width as needed
                  ),
                ),

                SizedBox(
                    height: 40), // Add some space between the image and text
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                          size: 20,
                          weight: FontWeight.bold,
                          color: customGreen,
                          text: widget.product),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.desc,
                    textAlign: TextAlign.left, // Align text to the center
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                          size: 20,
                          weight: FontWeight.bold,
                          color: customGreen,
                          text: widget.price),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: customGreen,
                        ),
                        child: Center(
                            child: CustomText(
                                size: 18,
                                weight: FontWeight.bold,
                                color: white,
                                text: 'Cancel')),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return OrderPage(
                              image: widget.image,
                              price: widget.price,
                              name: widget.product);
                        }));
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: customGreen,
                        ),
                        child: Center(
                            child: CustomText(
                                size: 18,
                                weight: FontWeight.bold,
                                color: white,
                                text: 'Buy')),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
