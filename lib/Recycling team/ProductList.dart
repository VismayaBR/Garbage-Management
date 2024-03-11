import 'package:cloud_firestore/cloud_firestore.dart';
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
// ----------warning list-------------
  Future<QuerySnapshot<Map<String, dynamic>>> productData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('product').get();

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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
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
      body: FutureBuilder(
          future: productData(),
          builder: (context, snapshot) {
            final users = snapshot.data?.docs ?? [];
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (ctx, index) {
                var request = users[index].data() as Map<String, dynamic>;
                var id = users[index].id;
                return Card(
                  color: maincolor,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(request['imagePath']),
                    ),
                    subtitle: CustomText(
                        size: 13,
                        weight: FontWeight.normal,
                        color: customBalck,
                        text: request['desc']),
                    title: CustomText(
                      color: customBalck,
                      size: 14,
                      weight: FontWeight.normal,
                      text: request['name'],
                    ),
                    trailing: CustomText(size: 15, weight: FontWeight.bold, color: customBalck, text: 'Rs. ${request['price']}'),
                  ),
                );
              },
            );
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CustomText(
                        size: 15,
                        weight: FontWeight.bold,
                        color: white,
                        text: 'View Booking'),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: customGreen),
                ),
              ),
              FloatingActionButton(
                backgroundColor: customGreen,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return AddProduct();
                  }));
                },
                child: Icon(
                  Icons.add,
                  color: white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
