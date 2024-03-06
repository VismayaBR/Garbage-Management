import 'package:flutter/material.dart';
import 'package:garbage_management/Public/OrderPlaced.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset('assets/product.png'),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: CustomText(
                        size: 16,
                        weight: FontWeight.normal,
                        color: customBalck,
                        text: 'Product :'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: CustomText(
                        size: 16,
                        weight: FontWeight.normal,
                        color: customBalck,
                        text: 'Price :'),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: CustomText(
                        size: 16,
                        weight: FontWeight.normal,
                        color: customBalck,
                        text: 'Delivery date :'),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: CustomText(
                        size: 16,
                        weight: FontWeight.normal,
                        color: customBalck,
                        text: 'Sticky notes'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: CustomText(
                        size: 20,
                        weight: FontWeight.bold,
                        color: customBalck,
                        text: 'Rs. 150'),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: CustomText(
                        size: 16,
                        weight: FontWeight.normal,
                        color: customBalck,
                        text: '01/03/2024'),
                  )
                ],
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(size: 17, weight: FontWeight.w700, color: customBalck, text: 'Address'),
                    CustomText(size: 15, weight: FontWeight.w400, color: customBalck, text: 'asdffff acadcdccwxasw '),
                    CustomText(size: 15, weight: FontWeight.w400, color: customBalck, text: 'asdffff acadcdccwxasw '),
                    CustomText(size: 15, weight: FontWeight.w400, color: customBalck, text: '+0987655455'),
                
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return OrderPlaced();
                }));
              },
              child: Container(
                height: 50,width: double.infinity,child: Center(child: CustomText(size: 18, weight: FontWeight.bold, color: white, text: 'Place order')),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: customGreen),
              ),
            ),
          )
        ],
      ),
    );
  }
}
