import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.address,
    required this.phone,
  });

  final String name;
  final String address;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: customGreen1,
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: customBalck),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                          color: white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      address,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: white),
                    ),
                    CustomText(
                        text: phone,
                        weight: FontWeight.w400,
                        size: 12,
                        color: white),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
