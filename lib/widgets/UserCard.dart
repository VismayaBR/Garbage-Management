import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.address,
    required this.phone,
    required this.user_id,
  });

  final String name;
  final String address;
  final String phone;
  final String user_id;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: customGreen1,
      shape: OutlineInputBorder(
        borderSide: const BorderSide(color: customBalck),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          address,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: white,
                          ),
                        ),
                        CustomText(
                          text: phone,
                          weight: FontWeight.w400,
                          size: 12,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('garbage_status')
                  .where('user_id', isEqualTo: user_id)
                  .where('date', isEqualTo: DateFormat('yyyy-MM-dd').format(DateTime.now()))
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final docs = snapshot.data?.docs;
                  if (docs != null && docs.isNotEmpty) {
                    final status = docs[0]['status'] as String?;
                    if (status == 'collected') {
                      return CustomText(size: 12, weight: FontWeight.normal, color: white, text: 'Collected');
                    }
                  }
                  return InkWell(
                    onTap: () async {
                      // Logic to mark collection as complete
                      String dt1 = DateFormat('yyyy-MM-dd').format(DateTime.now());
                      SharedPreferences spref = await SharedPreferences.getInstance();
                      var d_id = spref.getString('user_id');
                      FirebaseFirestore.instance.collection('garbage_status').add({
                        'user_id': user_id,
                        'diver_id': d_id,
                        
                        'status': 'collected',
                        'date': dt1,
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: maincolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          size: 12,
                          weight: FontWeight.normal,
                          color: Colors.red,
                          text: 'Pending',
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
