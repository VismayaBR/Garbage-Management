import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';

class ResetPassword extends StatefulWidget {
  String email;
  ResetPassword({Key? key, required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var password = TextEditingController();
  var cpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomPaint(
          size: Size(
              300,
              (500 * 2)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
                size: 20,
                weight: FontWeight.w500,
                color: customGreen,
                text: 'Reset Password'),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 20),
              child: CustomTextField(
                label: 'New Password',
                controller: password,
                size: 14,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter new password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 20),
              child: CustomTextField(
                label: 'Confirm Password',
                controller: cpassword,
                size: 14,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (cpassword.text == password.text) {
                      print('equal');
                      QuerySnapshot querySnapshot = await FirebaseFirestore
                          .instance
                          .collection('users')
                          .where('email', isEqualTo: widget.email)
                          .get();

                      if (querySnapshot.docs.isNotEmpty) {
                        DocumentReference userDocRef =
                            querySnapshot.docs.first.reference;
                        await userDocRef.update({
                          'password': password.text,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Password updated",style: TextStyle(color: white),),backgroundColor: customGreen,),
                          );
                      } else {
                        // Handle case where no documents match the query
                        print('No user found with the provided email.');
                      }
                    } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Passwords are doesn't match",style: TextStyle(color: white),),backgroundColor: customGreen,),
                          );
                      print('not equal');
                    }
                  },
                  child: Text('Done')),
            )
          ],
        )
      ]),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 14, 135, 25)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint_fill_0.shader = ui.Gradient.linear(
        Offset(size.width * -0.01, size.height * 0.50),
        Offset(size.width * 1.01, size.height * 0.50), [
      Color(0xff0e8d0d),
      Color(0xff0bab0b),
      Color(0xff6bdc4a),
      Color(0xffffffff)
    ], [
      0.00,
      0.21,
      0.80,
      1.00
    ]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5066899, size.height * 0.0016667);
    path_0.quadraticBezierTo(size.width * 0.3046305, size.height * 0.1444167,
        size.width * 0.2299982, size.height * 0.2283833);
    path_0.cubicTo(
        size.width * 0.1417872,
        size.height * 0.3360333,
        size.width * 0.1173151,
        size.height * 0.4049333,
        size.width * 0.1089551,
        size.height * 0.4615667);
    path_0.cubicTo(
        size.width * 0.1089551,
        size.height * 0.5007333,
        size.width * 0.1352005,
        size.height * 0.6780167,
        size.width * 0.3175506,
        size.height * 0.7958667);
    path_0.quadraticBezierTo(size.width * 0.5047646, size.height * 0.9266333,
        size.width * 1.0066705, size.height * 0.9966667);
    path_0.lineTo(size.width * -0.0066667, size.height * 0.9950000);
    path_0.lineTo(size.width * 0.0085334, size.height * -0.0016667);

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
