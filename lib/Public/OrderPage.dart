import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Public/OrderPlaced.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPage extends StatefulWidget {
  String image;
  String price;
  String name;
  OrderPage(
      {super.key,
      required this.image,
      required this.price,
      required this.name});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  var u_id;
  
  var nm;
  var ad;
  var ph;
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      nm =spref.getString('name');
      print(nm);
    ad =spref.getString('address');
    ph =spref.getString('phone');
    });
    
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
              width: 200,
              height: 200,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              )),
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
                        text: widget.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: CustomText(
                        size: 20,
                        weight: FontWeight.bold,
                        color: customBalck,
                        text: widget.price),
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
                    CustomText(
                        size: 17,
                        weight: FontWeight.w700,
                        color: customBalck,
                        text: 'Address'),
                    CustomText(
                        size: 15,
                        weight: FontWeight.w400,
                        color: customBalck,
                        text: nm),
                    CustomText(
                        size: 15,
                        weight: FontWeight.w400,
                        color: customBalck,
                        text: ad),
                    CustomText(
                        size: 15,
                        weight: FontWeight.w400,
                        color: customBalck,
                        text: ph),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () async {
                  String dt1 = DateFormat('yyyy-MM-dd').format(DateTime.now());

                SharedPreferences spref  = await SharedPreferences.getInstance();
                setState(() {
                  u_id = spref.getString('user_id');
                });
                FirebaseFirestore.instance.collection('orders').add({
                  'user_Id':u_id,
                  'product':widget.name,
                  'price':widget.price,
                  'date':dt1
                });
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return OrderPlaced();
                }));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                    child: CustomText(
                        size: 18,
                        weight: FontWeight.bold,
                        color: white,
                        text: 'Place order')),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: customGreen),
              ),
            ),
          )
        ],
      ),
    );
  }
}
