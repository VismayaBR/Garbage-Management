import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/UserCard.dart';
import 'package:garbage_management/widgets/team.dart';

class Degradable extends StatefulWidget {
  const Degradable({super.key});

  @override
  State<Degradable> createState() => _DegradableState();
}

class _DegradableState extends State<Degradable> {

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('type', isEqualTo: 'Recycling team')
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
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
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
                      return Team(
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
    );
  }
}