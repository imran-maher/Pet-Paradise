//TODO : Seller Profile in Working

import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller/module/seller_info.dart';
import 'package:pet_paradise/utils/colors.dart';

class SellerAddBasicProfileInfoPage extends StatefulWidget {
  late final SellerBasicInfo _sellerBasicInfo;
   SellerAddBasicProfileInfoPage({Key? key,required SellerBasicInfo sellerBasicInfo}) : super(key: key){
    this._sellerBasicInfo = sellerBasicInfo;
  }

  @override
  State<SellerAddBasicProfileInfoPage> createState() =>
      _SellerAddBasicProfileInfoPageState();
}

class _SellerAddBasicProfileInfoPageState extends State<SellerAddBasicProfileInfoPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _storeNameController = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = widget._sellerBasicInfo.emailAddress?? "";
    _mobileNumberController.text = widget._sellerBasicInfo.phoneNumber?? "";
    _storeNameController.text = widget._sellerBasicInfo.storeName?? "" ;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,
      appBar: transparentAppBar(context: context, centerTitle: "Add Profile"),
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }

  /// Mobile UI
  Widget mobile(BuildContext context) {
    return leftAndRightPadding(
        child: Card(
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 370,
        child: leftAndRightPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 15,
              ),
              Center(child: Text("Profile Information")),
              Divider(
                color: MyColors.GREEN_LIGHT_SHADE,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Itim-Regular',
                        color: Colors.grey),
                  ),
                  clickAbleText(
                      text: 'Add >',
                      fontFamily: 'Itim-Regular',
                      textSize: 13,
                      textColor: Colors.grey,
                      onTap: () {}),
                ],
              ),
              TextField(controller: _emailController, readOnly: true),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mobile Number",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Itim-Regular',
                        color: Colors.grey),
                  ),
                  clickAbleText(
                      text: 'Change >',
                      fontFamily: 'Itim-Regular',
                      textSize: 13,
                      textColor: Colors.grey,
                      onTap: () {}),
                ],
              ),
              TextField(controller: _mobileNumberController, readOnly: true),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Store Name",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Itim-Regular',
                        color: Colors.grey),
                  ),
                ],
              ),
              TextField(controller: _storeNameController, readOnly: true),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ));
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
