import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';

import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/size_config.dart';

import '../module/seller_info.dart';

class SellerAddAddressPage extends StatefulWidget {
  late final SellerAddressModule _sellerAddressModule;

  SellerAddAddressPage(
      {Key? key, required SellerAddressModule sellerAddressModule})
      : super(key: key) {
    this._sellerAddressModule = sellerAddressModule;
  }

  @override
  State<SellerAddAddressPage> createState() => _SellerAddAddressPageState();
}

class _SellerAddAddressPageState extends State<SellerAddAddressPage> {
  final _businessAddressController = TextEditingController();
  final _wareHouseAddressController = TextEditingController();
  final _returnAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,
      appBar: transparentAppBar(context: context, centerTitle: "Add Address"),
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }

  /// Mobile UI
  Widget mobile(BuildContext context) {
    return SingleChildScrollView(
      child: leftAndRightPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///Business Address Card
            SizedBox(
              height: 15,
            ),
            Card(
              child: Container(
                height: 155,
                child: leftAndRightPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Business Address",
                          style: TextStyle(
                              fontFamily: 'Itim-Regular', fontSize: 12),
                        ),
                      ),
                      Divider(
                        color: MyColors.GREEN,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      readOnlyTextFiled(
                          context: context,
                          controller: _businessAddressController,
                          hint: 'Address',
                          important: true),
                      Divider(
                        color: MyColors.GREEN,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ///Ware House Address Card
            SizedBox(
              height: 15,
            ),
            Card(
              child: Container(
                height: 190,
                child: leftAndRightPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Warehouse Address",
                          style: TextStyle(
                              fontFamily: 'Itim-Regular', fontSize: 12),
                        ),
                      ),
                      Divider(
                        color: MyColors.GREEN,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Same as business",
                            style: TextStyle(fontFamily: 'Itim-Regular'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: MyColors.GREEN,
                      ),
                      readOnlyTextFiled(
                          context: context,
                          controller: _wareHouseAddressController,
                          hint: 'Address',
                          important: true),
                      Divider(
                        color: MyColors.GREEN,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ///Return Address Card
            SizedBox(
              height: 15,
            ),
            Card(
              child: Container(
                height: 190,
                child: leftAndRightPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Return Address",
                          style: TextStyle(
                              fontFamily: 'Itim-Regular', fontSize: 12),
                        ),
                      ),
                      Divider(
                        color: MyColors.GREEN,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Same as business",
                            style: TextStyle(fontFamily: 'Itim-Regular'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: MyColors.GREEN,
                      ),
                      readOnlyTextFiled(
                          context: context,
                          controller: _returnAddressController,
                          hint: 'Address',
                          important: true),
                      Divider(
                        color: MyColors.GREEN,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MyAppSize.width! * 0.1, vertical: 10),
              child: MyButton(
                  onPressed: () {},
                  title: "Submit",
                  color: MyColors.GREEN_LIGHT_SHADE,
                  textColor: Colors.white,
                  height: 45,
                  splashColor: MyColors.YELLOW,
                  borderRadius: 30,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  /// Tablet UI
  Widget tablet(BuildContext context) {
    return Center(
      child: Text("In Design Process"),
    );
  }

  /// Web UI
  Widget web(BuildContext context) {
    return Center(
      child: Text("In Design Process"),
    );
  }
}
