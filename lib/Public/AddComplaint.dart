import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Admin/Recycle%20warning.dart';
import 'package:garbage_management/Admin/SendWarningDriver.dart';
import 'package:garbage_management/Controllers/AdminServices.dart';
import 'package:garbage_management/Public/ComplaintList.dart';
import 'package:garbage_management/Public/PublicNavbar.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/AdNotificationCad.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/NotificationCard.dart';
import 'package:garbage_management/widgets/WarnigCard.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddComplaints extends StatefulWidget {
   AddComplaints({super.key});

  @override
  State<AddComplaints> createState() => _AddComplaintsState();
}

class _AddComplaintsState extends State<AddComplaints> {
var complaint = TextEditingController();
var u_id;

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
            text: "AddComplaints",
            weight: FontWeight.w400,
            size: 20,
            color: customBalck),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextFormField(
                  maxLines: 4,
                  controller: complaint,
                  decoration: InputDecoration(
                      labelText: 'Add complaint...', border: OutlineInputBorder()),
                ),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                   String dt1 = DateFormat('yyyy-MM-dd').format(DateTime.now());

                SharedPreferences spref  = await SharedPreferences.getInstance();
                setState(() {
                  u_id = spref.getString('user_id');
                });
                  FirebaseFirestore.instance.collection('user_complaints').add({
                    'user_id':u_id,
                    'complaint':complaint.text,
                    'date':dt1,
                    'replay':'',
                    'status':'0'
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                    return PublicNav();
                  }));
                },
                child: Text('Send'),
              )
          ],
        ),
      ));
  }
}
