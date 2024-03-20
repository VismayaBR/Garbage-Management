import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Public/AddComplaint.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/ComplaintCard.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class ComplaintList extends StatelessWidget {
  const ComplaintList({Key? key});

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('user_complaints')
              // .where('type', isEqualTo: 'Driver')
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
            text: "Complaints",
            weight: FontWeight.w400,
            size: 20,
            color: customBalck),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final complaints = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: complaints.length,
                  itemBuilder: (context, index) {
                    var data = complaints[index].data() as Map<String, dynamic>;
                    var id = complaints[index].id;
                    return ComplaintCard(
                      title: data['complaint'].toString(),
                      reply: data['replay'].toString(),
                      date: data['date'].toString(),
                      status: data['status'].toString(),
                    );
                  },
                );
              }
            }),
      ),
      floatingActionButton: Column(
        children: [
          SizedBox(height: 60,),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return AddComplaints();
              }));
            },
            child: Icon(Icons.add,color: Colors.white,),
            backgroundColor: customGreen,
          ),
        ],
      ),
    );
  }
}
