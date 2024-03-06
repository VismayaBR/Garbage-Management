import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  CustomText(
      {super.key,
      required this.size,
      required this.weight,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: size, fontWeight: weight, color: color),
    );
  }
}
