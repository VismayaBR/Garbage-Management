 import 'package:flutter/material.dart';
import 'package:garbage_management/Controllers/AdminServices.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
class UsersLists extends StatefulWidget {
  const UsersLists({super.key});
  @override
  State<UsersLists> createState() => _UsersListsState();
}

class _UsersListsState extends State<UsersLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getUsersData(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            // Display a circular progress indicator while waiting for data
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snap.hasError) {
            // Handle error case
            return Center(
              child: Text("Error: ${snap.error}"),
            );
          } else {
            final users = snap.data?.docs ?? [];
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (ctx, index) {
                var request = users[index].data() as Map<String, dynamic>;
                var id = users[index].id;
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
                              text: request['username'] ?? 'Loading'),
                          CustomText(
                              size: 15,
                              weight: FontWeight.normal,
                              color: customBalck,
                              text: request['email'] ?? 'Loading'),
                          CustomText(
                              size: 15,
                              weight: FontWeight.normal,
                              color: customBalck,
                              text: request['phone'] ?? 'Loading'),
                          request['status']=='0'? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: (){
                                  rejectUsers(user_id:id);
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                        size: 12,
                                        weight: FontWeight.normal,
                                        color: white,
                                        text: 'Reject'),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                  acceptUsers(user_id:id);
                                  setState(() {

                                  });
                                },
                                child: Container(
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
                                        text: 'Accept'),
                                  ),
                                ),
                              ),
                            ],
                          ):request['status']=='2'?Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                      size: 12,
                                      weight: FontWeight.normal,
                                      color: white,
                                      text: 'Rejected'),
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
                                      text: 'Accepted'),
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
          }
        },
      ),
    );
  }
}
