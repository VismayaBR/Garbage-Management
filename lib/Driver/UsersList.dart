import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/UserCard.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
 
 Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('type', isEqualTo: 'User')
              .get();

      print('Firestore Data: ${querySnapshot.docs}');

      return querySnapshot;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the exception to be caught by the FutureBuilder
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: customBalck,
              ),
            ),
          ),
          backgroundColor: maincolor,
          title: CustomText(
            text: "Users",
            weight: FontWeight.w400,
            size: 20,
            color: customBalck
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: 
              FutureBuilder(
               future: getData(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final user = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return UserCard(
                        user_id:user[index].id,
                        name: user[index]['username'],
                        address: user[index]['address'],
                        phone: user[index]['phone'],
                        
                      );
                    },
                  );
                }
  })
        )
      ),
    );
  }
}