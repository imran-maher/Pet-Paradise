import 'package:flutter/material.dart';
import 'package:pet_paradise/seller_module/pages/prifile_setup/seller_add_bank_info_induvisual.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';

import '../../../utils/colors.dart';

TextEditingController compnyNameController = TextEditingController();
TextEditingController businessRegNumberController = TextEditingController();

class SellerCorporatedInfoPage extends StatefulWidget {
  const SellerCorporatedInfoPage({Key? key}) : super(key: key);

  @override
  State<SellerCorporatedInfoPage> createState() =>
      _SellerCorporatedInfoPageState();
}

class _SellerCorporatedInfoPageState extends State<SellerCorporatedInfoPage> {
  @override
  Widget build(BuildContext context) {
    return customBodyWithCenterTextAppBar(
        context: context,
        appBarTitle: "CORPORATED INFORMATION",
        responsiveScreens: Responsive(
            mobile: mobile(context), tablet: tabletUI(), web: webUI()));
  }

  ///Mobile
  Widget mobile(BuildContext context) {
    return leftAndRightPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ///Circular avatar text Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: MyColors.GREEN_LIGHT_SHADE,
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 43.83,
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xff89aa28),
                ),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(color: MyColors.GREEN_LIGHT_SHADE),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 15,
          ),
          Center(
              child: Text(
            "Step1 :  Corporate Information",
            style: TextStyle(fontSize: 12, fontFamily: 'Itim-Regular'),
          )),
          SizedBox(
            height: 15,
          ),

          Text(
            "Your account information is secure ",
            style: TextStyle(fontSize: 12, fontFamily: 'Itim-Regular'),
          ),

          ///ID Documents
          Card(
            child: Container(
              height: 180,
              child: Column(
                children: [
                  leftAndRightPadding(
                      child: importantText(
                          text: "ID Documents",
                          fontSize: 18,
                          textColor: Colors.black)),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),

                  ///Business Registration DOCUMENT

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///ID Front Side
                      Column(
                        children: [
                          Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: MyColors.GREEN_LIGHT_SHADE,
                            )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text(
                                  "Upload",
                                  style: TextStyle(
                                      fontFamily: 'Itim-Regular', fontSize: 11),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          ///ID information
          Card(
            child: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Business Registration Documents",
                      style:
                          TextStyle(fontSize: 12, fontFamily: 'Itim-Regular'),
                    ),
                  ),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),
                  leftAndRightPadding(
                      child: myCustomTextFiled(
                          context: context,
                          controller: compnyNameController,
                          hint: "Company Legal Name",
                          important: true)),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),
                  leftAndRightPadding(
                      child: myCustomTextFiled(
                          context: context,
                          controller: businessRegNumberController,
                          hint: "Business Registration Number",
                          important: true)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          MyButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SellerAddBankIndividual()));
              },
              title: "Next",
              fontSize: 14,
              fontFamily: 'Itim-Regular',
              height: 45,
              color: MyColors.GREEN_LIGHT_SHADE,
              textColor: Colors.white,
              borderRadius: 25)
        ],
      ),
    );
  }
}
