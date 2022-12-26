import 'package:flutter/material.dart';
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
        });
      },
    );
  }
}
