import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard(
      {super.key,
      required this.title,
      required this.reply,
      required this.date,
      required this.status});

  final String title;
  final String reply;
  final String date;
  final String status;

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
              text: reply, weight: FontWeight.w400, size: 12, color: white),
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
                          color: white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      status,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: white),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
              text: date, weight: FontWeight.w400, size: 12, color: white),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:  Text('Replay'),
                            content: status=='0'?Text('No Reply'):Text(reply),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: CustomText(
                        size: 12,
                        weight: FontWeight.normal,
                        color: white,
                        text: 'Replay')),
                Icon(
                  Icons.insert_comment_outlined,
                  color: white,
                  size: 15,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
