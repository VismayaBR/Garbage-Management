import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifiactionCard extends StatelessWidget {
  const NotifiactionCard({
    super.key,
    required this.title,
    required this.time,
    required this.date,
    required this.content
  });

  final String title;
  final String time;
  final String date;
  final String content;

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
         CustomText(
              text: time,
              weight: FontWeight.w400,
              size: 12,
              color: white
              ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color:white),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      content,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color:white),
                    ),
                  ],
                )),
          ),
          SizedBox(height: 10,),
          CustomText(
              text: date,
              weight: FontWeight.w400,
              size: 12,
              color: white),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: CustomText(size: 12, weight: FontWeight.normal, color: white, text: 'Replay  ')),
                    Icon(Icons.insert_comment_outlined,color: white,size: 15,)
                  ],
                )
        ]),
      ),
    );
  }
}
