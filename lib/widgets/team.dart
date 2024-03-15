import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Team extends StatelessWidget {
  const Team({
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
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: (){
                        launchUrl(
                                  Uri.parse('tel:${phone}'));
                            },
                    child: Icon(Icons.call,color: customGreen,size: 20,)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
