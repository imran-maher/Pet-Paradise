import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller_module/pages/seller_add_pet.dart';

class SellerToolsPage extends StatefulWidget {
  const SellerToolsPage({Key? key}) : super(key: key);

  @override
  State<SellerToolsPage> createState() => _SellerToolsPageState();
}

class _SellerToolsPageState extends State<SellerToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context, centerTitle: "Tools"),
      body: Responsive(
        mobile: mobile(context),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  /// mobile
  Widget mobile(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget(),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              leftAndRightPadding(
                  child: Text(
                "Basic Functions",
                style: TextStyle(fontSize: 20, fontFamily: 'Itim-Regular'),
              )),
              SizedBox(
                height: 15,
              ),

              ///First Row Tools
              leftAndRightPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ///Pets Tool
                    sellerToolButton(
                        onTape: () {},
                        title: "Pets",
                        imgPath: "assets/images/pet.png"),

                    ///Acessories/feeds Tool
                    sellerToolButton(
                        onTape: () {},
                        title: "Acessories/feeds",
                        imgPath: "assets/images/Feed.png"),

                    ///Order Tool
                    sellerToolButton(
                        onTape: () {},
                        title: "Order",
                        imgPath: "assets/images/order.png"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              ///Second Row Tools
              leftAndRightPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ///Manage Reviews Tool
                    sellerToolButton(
                        onTape: () {},
                        title: "Manage Reviews",
                        imgPath: "assets/images/reviws.png"),

                    ///Schedule Drop-offs Tool
                    sellerToolButton(
                        onTape: () {},
                        title: "Schedule Drop-offs",
                        imgPath: "assets/images/shipShedule.png"),

                    ///Finance Tool
                    sellerToolButton(
                        onTape: () {},
                        title: "Finance",
                        imgPath: "assets/images/finance.png"),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              ///Third Row Tools
              leftAndRightPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ///Add Pet Tool
                    sellerToolButton(
                        onTape: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellerAddPet()));
                        },
                        title: "Add Pet",
                        imgPath: "assets/images/addPet.png"),

                    ///Add Accessorie/Feed Tool
                    sellerToolButton(
                        onTape: () {},
                        title: "Schedule Drop-offs",
                        imgPath: "assets/images/addFeed.png"),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
