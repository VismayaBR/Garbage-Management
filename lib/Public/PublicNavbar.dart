import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:garbage_management/Public/Driver.dart';
import 'package:garbage_management/Public/Profile.dart';
import 'package:garbage_management/Public/PublicHome.dart';
import 'package:garbage_management/constants/colors.dart';

class PublicNav extends StatefulWidget {
  const PublicNav({Key? key}) : super(key: key);

  @override
  State<PublicNav> createState() => _PublicNavState();
}

class _PublicNavState extends State<PublicNav> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this); // Define the length as per your requirement
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomBar(
        child: TabBar(
          controller: tabController,
          tabs: [
            // Define your tabs here
               Tab(icon: Icon(Icons.home,color: white,)),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Tab(icon: Icon(Icons.fire_truck,color: white,)),
            ),
         
             Tab(icon: Icon(Icons.note,color: white,)),
          ],
        ),
        fit: StackFit.expand,
        icon: (width, height) => Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: null,
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: maincolor,
              size: width,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(500),
        duration: Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        barColor: customGreen.computeLuminance() > 0.5 ? Color.fromARGB(255, 171, 255, 167) : customGreen,
        start: 1,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 35,
        iconWidth: 35,
        reverse: false,
        barDecoration: BoxDecoration(
          color: customGreen,
          borderRadius: BorderRadius.circular(500),
        ),
        iconDecoration: BoxDecoration(
          color: customGreen,
          borderRadius: BorderRadius.circular(500),
        ),
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: [
            // Add your tab views here
            
            PublicHome(),
            Driver(),
            Container(color: Color.fromARGB(255, 255, 225, 225)),
            
          ],
        ),
      ),
    );
  }
}
