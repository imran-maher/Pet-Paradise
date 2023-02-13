import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/colors.dart';

class SellerDashboardPage extends StatefulWidget {
  late final List _pages;
  SellerDashboardPage({Key? key , required List<Widget> pages}) : super(key: key){
    this._pages = pages;
  }

  @override
  State<SellerDashboardPage> createState() => _SellerDashboardPageState();
}

class _SellerDashboardPageState extends State<SellerDashboardPage> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.MATERIAL_LIGHT_GREEN,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit) , label: "Tools"),
          BottomNavigationBarItem(icon: Icon(Icons.message) , label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person) , label: "Profile"),

        ],
        onTap: (index){
          setState(() {
            selectedPage = index;
          });
        },
        currentIndex: selectedPage,
      ),
      body: widget._pages[selectedPage],
    );
  }
}
