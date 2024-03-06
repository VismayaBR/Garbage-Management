import 'package:flutter/material.dart';
import 'package:garbage_management/Public/OrderPage.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
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
                Image.asset(
                  'assets/product.png',
                  // Adjust the width as needed
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
                          text: 'Product'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever',
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
                          text: 'Rs. 150'),
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
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: customGreen,
                      ),
                      child: Center(
                          child: CustomText(
                              size: 20,
                              weight: FontWeight.bold,
                              color: white,
                              text: 'Cancel')),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:(ctx){
                        return OrderPage();
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
                                size: 20,
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
