import 'package:flutter/material.dart';
import 'package:garbage_management/Public/Notification.dart';
import 'package:garbage_management/Public/Profile.dart';
import 'package:garbage_management/Public/ViewProduct.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class PublicHome extends StatefulWidget {
  const PublicHome({super.key});

  @override
  State<PublicHome> createState() => _PublicHomeState();
}

class _PublicHomeState extends State<PublicHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(top: 30,left: 18,right:18),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return ProfilePublic();
              }));
            },
            child: Icon(Icons.person,size: 35,color: customGreen,),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 18,right:18),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return Notifications();
                }));
              },
              child: Icon(Icons.notifications,size: 35,color: customGreen,)),
          ),
          
        ],
      ),
      body:Column(
        children: [
          Text('Products'),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Divider(),
          ),
          Expanded(
            child: Center(
                child: ResponsiveGridList(
                  minItemWidth: 150,
                  children: List.generate(
                    5,
                    (index) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx){
                          return ViewProduct();
                        }));
                      },
                      child: Container(
                        color: maincolor,
                        height: 200,
                        child: Center(
                          child: Image.asset('assets/product.png')
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
      
    
    );
  }
}