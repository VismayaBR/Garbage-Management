import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Admin/DriverList.dart';
import 'package:garbage_management/Admin/RecycleList.dart';
import 'package:garbage_management/Admin/UsersLists.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  var name = TextEditingController();
  var contact = TextEditingController();
  var location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return UsersLists();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: customGreen,
                ),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: CustomText(
                      size: 17,
                      weight: FontWeight.w500,
                      color: white,
                      text: 'Users'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return DriverList();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: customGreen,
                ),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: CustomText(
                      size: 17,
                      weight: FontWeight.w500,
                      color: white,
                      text: 'Drivers'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return RecycleList();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: customGreen,
                ),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: CustomText(
                      size: 17,
                      weight: FontWeight.w500,
                      color: white,
                      text: 'Recycling team'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // Your custom dialog content goes here
                    return AlertDialog(
                      title: Text('Add team'),
                      actions: [
                        CustomTextField(
                          label: 'Name',
                          controller: name,
                          size: 14,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          label: 'Contact',
                          controller: contact,
                          size: 14,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter mobile number';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          label: 'Location',
                          controller: location,
                          size: 14,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter  location';
                            }
                            return null;
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseFirestore.instance.collection('bio_team').add({
                              'name':name.text,
                              'contact':contact.text,
                              'location':location.text
                            });
                            Navigator.pop(context);
                            name.clear();
                            contact.clear();
                            location.clear();
                          },
                          child: Text('ADD'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: customGreen,
                ),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: CustomText(
                      size: 17,
                      weight: FontWeight.w500,
                      color: white,
                      text: 'Add Biodegradable team'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
