import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Login.dart';
import 'package:garbage_management/Public/Notification.dart';
import 'package:garbage_management/Public/Profile.dart';
import 'package:garbage_management/Public/ViewProduct.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class PublicHome extends StatefulWidget {
  const PublicHome({super.key});

  @override
  State<PublicHome> createState() => _PublicHomeState();
}

class _PublicHomeState extends State<PublicHome> {
  Future<QuerySnapshot> getData() {
    return FirebaseFirestore.instance.collection('product').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return ProfilePublic();
              }));
            },
            child: Icon(
              Icons.person,
              size: 35,
              color: customGreen,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 18, right: 2),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return Notifications();
                }));
              },
              child: Icon(
                Icons.notifications,
                size: 23,
                color: customGreen,
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 18),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
                  return Login();
                }));
              },
              child: Icon(
                Icons.power_settings_new_rounded,
                size: 23,
                color: customGreen,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Text('Products'),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Divider(),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  List<DocumentSnapshot> products = snapshot.data!.docs;

                  return ResponsiveGridList(
                    minItemWidth: 150,
                    children: List.generate(
                      products.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return ViewProduct(
                              image: products[index]['imagePath'],
                                product: products[index]['name'],
                                price: products[index]['price'],
                                desc: products[index]['desc']);
                          }));
                        },
                        child: Container(
                          color: white,
                          height: 200,
                          child: Center(
                            child: Image.network(
                              products[index]['imagePath'].toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
