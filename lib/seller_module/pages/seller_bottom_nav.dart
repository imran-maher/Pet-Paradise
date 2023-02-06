import 'package:flutter/material.dart';
import 'package:pet_paradise/seller_module/pages/seller_home_page.dart';
import 'package:pet_paradise/seller_module/pages/seller_messages_notification_page.dart';
import 'package:pet_paradise/seller_module/pages/seller_profile_info_page.dart';
import 'package:pet_paradise/seller_module/pages/seller_tools_page.dart';

import 'package:pet_paradise/utils/colors.dart';

class SellerBottomNavBar extends StatefulWidget {
  const SellerBottomNavBar({Key? key}) : super(key: key);

  @override
  State<SellerBottomNavBar> createState() => _SellerBottomNavBarState();
}

class _SellerBottomNavBarState extends State<SellerBottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.pan_tool,
            ),
            label: "Tools"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.data_saver_off,
            ),
            label: "Data"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: "Messages"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Me"),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: MyColors.GREEN,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      onTap: (index){
        setState(() {
          selectedIndex = index;
          if(selectedIndex == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SellerHomePage()));
          }
          else if(selectedIndex == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SellerToolsPage()));
          }
          else if(selectedIndex == 2){}
          else if(selectedIndex == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SellerMessagesAndNotificationPage()));
          }
          else if(selectedIndex == 4){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SellerProfileInfoPage()));
          }
        });
      },
    );
  }
}
