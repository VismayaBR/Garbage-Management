import 'package:flutter/material.dart';
import 'package:garbage_management/Driver/AdminNotification.dart';
import 'package:garbage_management/Public/UpdateProfile.dart';
import 'package:garbage_management/Recycling%20team/AddProduct.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return UpdateProfile();
              }));
            },
            child: Icon(Icons.person)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return AdminNotification();
                }));
              },
              child: Icon(Icons.notifications)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.power_settings_new_outlined),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            color: maincolor,
            child: ListTile(
              title: CustomText(
                color: customBalck,
                size: 14,
                weight: FontWeight.normal,
                text: 'qwertyu',
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return AddProduct();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
