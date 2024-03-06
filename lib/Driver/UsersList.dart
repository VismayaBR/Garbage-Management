import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/UserCard.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: customBalck,
              ),
            ),
          ),
          backgroundColor: maincolor,
          title: CustomText(
            text: "Users",
            weight: FontWeight.w400,
            size: 20,
            color: customBalck
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: 
              ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return UserCard(
                    name: 'qwerty',
                    address: 'qewrtyu',
                    phone: '1234567890',
                    
                  );
                },
              )
        )
      ),
    );
  }
}