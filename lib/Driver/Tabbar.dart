import 'package:flutter/material.dart';
import 'package:garbage_management/Driver/AdminNotification.dart';
import 'package:garbage_management/Driver/BioDegradable.dart';
import 'package:garbage_management/Driver/Degradable.dart';
import 'package:garbage_management/Driver/Send%20Notification.dart';
import 'package:garbage_management/Driver/UsersList.dart';
import 'package:garbage_management/Login.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: InkWell(
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => EditProfile(),
            //       ));
            // },
            child: Image.asset(
              "assets/logo.png",
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendNotification(),
                      ));
                },
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.yellow[700],
                      size: 30,
                    ),
                     Positioned( // notification Icon......
                        left: 15,
                        top: 5,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.red,
                        )),
                  ],
                ),
              ),
            ),
            // SizedBox(width: 20,),
                 InkWell(
                   onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                          return Login();
                        }));
                      },
                  child: Icon(Icons.power_settings_new_outlined,size: 20,)
                ),
                SizedBox(width: 20,),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: customGreen),
                child: TabBar(
                  
                  tabs:  [
                    Tab(
                        child: CustomText(
                            text: "Degradable",
                            weight: FontWeight.w400,
                            size: 14,
                            color: customBalck,)),
                    Tab(
                        child: CustomText(
                            text: "BioDegradable",
                            weight: FontWeight.w400,
                            size: 14,
                            color: customBalck)),
                  ],
                  indicator: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10)),
                      // Creates border
                      color: maincolor),
                  dividerColor: Colors.transparent,
                  labelColor: white,
                  unselectedLabelColor: customBalck,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Expanded(
                child: TabBarView(children: [
              // Tab bar View.......
              Center(child: Degradable()),
              Center(child: BioDegradable())
            ]))
          ]),
        ),
      ),
    );
  }
}
