import 'package:flutter/material.dart';
import 'package:garbage_management/Admin/DriverList.dart';
import 'package:garbage_management/Admin/RecycleList.dart';
import 'package:garbage_management/Admin/UsersLists.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return UsersLists();
                }));
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: customGreen,),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: CustomText(size: 17, weight: FontWeight.w500, color: white, text: 'Users'),
                ),
               
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return DriverList();
                }));
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: customGreen,),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: CustomText(size: 17, weight: FontWeight.w500, color: white, text: 'Drivers'),
                ),
               
              ),
            ),
          ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return RecycleList();
                }));
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: customGreen,),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: CustomText(size: 17, weight: FontWeight.w500, color: white, text: 'Recycling team'),
                ),
               
              ),
            ),
          ),
        ],
      ),
    );
  }
}