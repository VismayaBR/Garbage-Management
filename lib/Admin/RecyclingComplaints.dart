import 'package:flutter/material.dart';
import 'package:garbage_management/Controllers/AdminServices.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class RecyclingComplaints extends StatefulWidget {
  const RecyclingComplaints({super.key});

  @override
  State<RecyclingComplaints> createState() => _RecyclingComplaintsState();
}

class _RecyclingComplaintsState extends State<RecyclingComplaints> {
    var rply = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: FutureBuilder(
          future: getRecyclingComplaints(),
          builder: (context, snap) {
            final complaints = snap.data?.docs ?? [];
            return ListView.builder(
              itemCount: complaints.length,
              itemBuilder: (ctx, index) {
                var request = complaints[index].data() as Map<String, dynamic>;
                var id = complaints[index].id;
                return Card(
                  child: ListTile(
                    tileColor: maincolor,
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              size: 15,
                              weight: FontWeight.normal,
                              color: customBalck,
                              text: 'Complaint : ${request['complaint']}' ?? 'Loading'),
                              Divider(),
                          CustomText(
                              size: 15,
                              weight: FontWeight.normal,
                              color: customBalck,
                              text: 'Reply : ${request['replay']}' ?? 'Loading'),
                         
                         request['status']=='0'? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // Your custom dialog content goes here
                                            return AlertDialog(
                                              title: Text('Send Reply'),
                                              content: TextFormField(
                                                controller: rply,
                                                maxLines: 3,
                                                decoration: InputDecoration(
                                                    label: Text('Reply'),
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    sendReply(id, rply);
                                                    // Close the dialog
                                                    setState(() {});
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Send'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.red,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CustomText(
                                              size: 12,
                                              weight: FontWeight.normal,
                                              color: white,
                                              text: 'add replay'),
                                        ),
                                      ),
                                    ),
                             
                            ],
                          ):Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: customGreen,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText(
                                            size: 12,
                                            weight: FontWeight.normal,
                                            color: white,
                                            text: 'Replied'),
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
