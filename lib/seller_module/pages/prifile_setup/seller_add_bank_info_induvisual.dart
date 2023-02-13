import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

import '../../../custom_widgets/custom_widgets.dart';
import '../../../utils/colors.dart';

//Controllers
TextEditingController accountTitleController = TextEditingController();
TextEditingController ibanController = TextEditingController();
TextEditingController accountNumberController = TextEditingController();
TextEditingController bankNameController = TextEditingController();
TextEditingController branchCodeController = TextEditingController();

class SellerAddBankIndividual extends StatefulWidget {
  const SellerAddBankIndividual({Key? key}) : super(key: key);

  @override
  State<SellerAddBankIndividual> createState() =>
      _SellerAddBankIndividualState();
}

class _SellerAddBankIndividualState extends State<SellerAddBankIndividual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,
      appBar: transparentAppBar(
        context: context,
        centerTitle: "Add Bank Information",
      ),
      body: Responsive(
        mobile: mobile(context),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  /// Mobile UI
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
                backgroundColor: Colors.white,
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(color: MyColors.GREEN_LIGHT_SHADE),
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
                backgroundColor: MyColors.GREEN_LIGHT_SHADE,
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 15,
          ),

          /// Step 2 Bank information
          Center(
              child: Text(
            "Step2 : Bank Information..",
            style: TextStyle(fontSize: 12, fontFamily: 'Itim-Regular'),
          )),
          SizedBox(
            height: 15,
          ),

          Text(
            "Your account information is secure ",
            style: TextStyle(fontSize: 12, fontFamily: 'Itim-Regular'),
          ),

          ///Bank Documents
          Card(
            child: Container(
              height: 180,
              child: Column(
                children: [
                  leftAndRightPadding(
                      child: importantText(
                          text: "Check Copy",
                          fontSize: 18,
                          textColor: Colors.black)),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),

                  ///ID Documents Images

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
            height: 10,
          ),

          ///Bank Account information
          Card(
            child: Container(
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Bank Account Information",
                      style:
                          TextStyle(fontSize: 18, fontFamily: 'Itim-Regular'),
                    ),
                  ),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),
                  leftAndRightPadding(
                      child: myCustomTextFiled(
                          context: context,
                          controller: accountTitleController,
                          hint: "Account Title",
                          important: true)),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),
                  leftAndRightPadding(
                      child: myCustomTextFiled(
                          context: context,
                          controller: ibanController,
                          hint: "IBAN",
                          important: true)),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),
                  leftAndRightPadding(
                      child: myCustomTextFiled(
                          context: context,
                          controller: accountNumberController,
                          hint: "Account Number",
                          important: true)),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),
                  leftAndRightPadding(
                      child: myCustomTextFiled(
                          context: context,
                          controller: bankNameController,
                          hint: "Bank Name ",
                          important: true)),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),
                  leftAndRightPadding(
                      child: myCustomTextFiled(
                          context: context,
                          controller: branchCodeController,
                          hint: "Branch Code",
                          important: true)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: "Previous",
                    color: Colors.white,
                    height: 45,
                    fontSize: 14,
                    fontFamily: 'Itim-Regular',
                    textColor: MyColors.GREEN_LIGHT_SHADE,
                    borderRadius: 25),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyButton(
                    onPressed: () {},
                    title: "Submit",
                    fontSize: 14,
                    fontFamily: 'Itim-Regular',
                    height: 45,
                    color: MyColors.GREEN_LIGHT_SHADE,
                    textColor: Colors.white,
                    borderRadius: 25),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
