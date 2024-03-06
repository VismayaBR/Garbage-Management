import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  String label;
  double size;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  var icon;
  CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.size,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(fontSize: size),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: customGreen),
        ),
      ),
    );
  }
}
