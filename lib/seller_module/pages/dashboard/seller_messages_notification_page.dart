import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';

import '../../../utils/colors.dart';

class SellerMessagesAndNotificationPage extends StatefulWidget {
  const SellerMessagesAndNotificationPage({Key? key}) : super(key: key);

  @override
  State<SellerMessagesAndNotificationPage> createState() =>
      _SellerMessagesAndNotificationPageState();
}

class _SellerMessagesAndNotificationPageState
    extends State<SellerMessagesAndNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Messages",
            style: TextStyle(fontFamily: 'Itim-Regular', fontSize: 20),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Chat",
                  style: TextStyle(fontFamily: 'Itim-Regular', fontSize: 15),
                ),
              ),
              Tab(
                child: Text(
                  "Notifications",
                  style: TextStyle(fontFamily: 'Itim-Regular', fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        body: Responsive(
          mobile: mobile(context),
          tablet: tabletUI(),
          web: webUI(),
        ),
      ),
    );
  }

  ///Message Body
  messageBody() {
    return Center(
      child: Text("Messages"),
    );
  }

  ///Notification Body
  notificationBody() {
    return Column(
      children: [
        ///Logistic
        SizedBox(
          height: 15,
        ),
        customContainerForSellerNotification(
            imgName: 'logistic.png', title: "Logistic"),

        ///System Notification
        SizedBox(
          height: 15,
        ),
        customContainerForSellerNotification(
            imgName: 'systemNotifications.png', title: "System Notification"),

        ///Product Notification
        SizedBox(
          height: 15,
        ),
        customContainerForSellerNotification(
            imgName: 'productNotifications.png', title: "Product Notification"),

        ///Order Notification
        SizedBox(
          height: 15,
        ),
        customContainerForSellerNotification(
            imgName: 'orderNotifications.png', title: "Order Notification")
      ],
    );
  }

  /// Mobile
  Widget mobile(BuildContext context) {
    return TabBarView(children: [messageBody(), notificationBody()]);
  }
}
