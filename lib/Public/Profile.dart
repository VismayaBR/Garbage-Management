import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:garbage_management/Public/ComplaintList.dart';
import 'package:garbage_management/Public/UpdateProfile.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class ProfilePublic extends StatefulWidget {
  const ProfilePublic({Key? key});

  @override
  State<ProfilePublic> createState() => _ProfilePublicState();
}

class _ProfilePublicState extends State<ProfilePublic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust the sigmaX and sigmaY values as needed
            child: Container(
              color: Colors.white.withOpacity(0.2), // Adjust the opacity as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80,),
                  
                 Padding(
                   padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                   child: SizedBox(
                    width: 80,height: 80,
                    child: Image.asset('assets/profile.png')),
                 ),
                 Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(size: 15, weight: FontWeight.normal, color: customGreen, text: 'Edit Profile'),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx){
                              return UpdateProfile();
                            }));
                          },
                          child: Icon(Icons.edit,color: customGreen,))
                      ],
                    ),
                  ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                           child: CustomText(size: 16, weight: FontWeight.normal, color: customBalck, text: 'Username  :'),
                         ),
                      
                     Padding(
                       padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                       child: CustomText(size: 16, weight: FontWeight.normal, color: customBalck, text: 'Email  :'),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                       child: CustomText(size: 16, weight: FontWeight.normal, color: customBalck, text: 'Password  :'),
                     ),
                       Padding(
                       padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                       child: CustomText(size: 16, weight: FontWeight.normal, color: customBalck, text: 'Mobile No  :'),
                     )
                      ],
                     ),
                      Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                       child: CustomText(size: 16, weight: FontWeight.normal, color: customBalck, text: 'Username'),
                     ),
                  
                 Padding(
                   padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                   child: CustomText(size: 16, weight: FontWeight.normal, color: customBalck, text: 'Email'),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                   child: CustomText(size: 16, weight: FontWeight.normal, color: customBalck, text: 'Password'),
                 ),
                   Padding(
                   padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
                   child: CustomText(size: 16, weight: FontWeight.normal, color: customBalck, text: 'Mobile No'),
                 )
                  ],
                 ),
                   ],
                 ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
