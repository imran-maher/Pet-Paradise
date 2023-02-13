import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller_module/pages/seller_bottom_nav.dart';


class SellerProfileInfoPage extends StatefulWidget {
  const SellerProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<SellerProfileInfoPage> createState() => _SellerProfileInfoPageState();
}

class _SellerProfileInfoPageState extends State<SellerProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return customBodyWithCenterTextAppBar(
        context: context,
        appBarTitle: "Profile",
        responsiveScreens: Responsive(
            mobile: mobile(context),
            tablet: tabletUI(),
            web: webUI()));
  }

  ///Tablet Mobile
  Widget mobile(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///Profile Area
          Container(
            height: 120,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Profile Pic
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    radius: 50,
                  ),
                ),

                /// profile info
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seller ID:",
                        style:
                            TextStyle(fontFamily: 'Itim-Regular', fontSize: 12),
                      ),
                      Text(
                        "PK2NBO1607V",
                        style: TextStyle(
                            fontFamily: 'Itim-Regular',
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Shop Name:",
                        style:
                            TextStyle(fontFamily: 'Itim-Regular', fontSize: 12),
                      ),
                      Text(
                        "PK2NBO1607V",
                        style: TextStyle(
                            fontFamily: 'Itim-Regular',
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),

          ///Account Settings
          sellerProfileContainer(
              tittle: "Account Settings", topBorder: true, onTap: () {}),

          ///General Information
          sellerProfileContainer(
              tittle: "General Information",
              bootomBorder: true,
              topBorder: true,
              onTap: () {}),
          SizedBox(height: 20),

          ///Account Statement
          sellerProfileContainer(
              tittle: "Account Statement", topBorder: true, onTap: () {}),

          ///Notifications
          sellerProfileContainer(
              tittle: "Notifications", topBorder: true, onTap: () {}),

          ///Chat
          sellerProfileContainer(tittle: "Chat", topBorder: true, onTap: () {}),

          ///Language
          sellerProfileContainer(
              tittle: "Language", topBorder: true, onTap: () {}),

          /// Seller Help Center
          sellerProfileContainer(
              tittle: " Seller Help Center", topBorder: true, onTap: () {}),

          /// Feedback
          sellerProfileContainer(
              tittle: " Feedback", topBorder: true, onTap: () {}),

          /// About
          sellerProfileContainer(
              tittle: " About",
              topBorder: true,
              bootomBorder: true,
              onTap: () {}),

          SizedBox(
            height: 10,
          ),

          /// Log out
          sellerProfileContainer(
              tittle: " Log out",
              topBorder: true,
              bootomBorder: true,
              onTap: () {}),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

}
