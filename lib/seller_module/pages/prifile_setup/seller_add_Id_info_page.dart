import 'package:flutter/material.dart';
import 'package:pet_paradise/seller_module/pages/prifile_setup/seller_add_bank_info_induvisual.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';

TextEditingController idNameController = TextEditingController();
TextEditingController idNumberController = TextEditingController();

class SellerAddIDInfoPage extends StatefulWidget {
  const SellerAddIDInfoPage({Key? key}) : super(key: key);

  @override
  State<SellerAddIDInfoPage> createState() => _SellerAddIDInfoPageState();
}

class _SellerAddIDInfoPageState extends State<SellerAddIDInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,
      appBar: transparentAppBar(
          context: context, centerTitle: "Add ID & Bank Info"),
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

          /// Step 1 ID information
          Center(
              child: Text(
            "Step1 : ID Information..",
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

                  ///ID Documents Images

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///ID Front Side
                      Column(
                        children: [
                          Text(
                            "Front Side ",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Itim-Regular',
                                color: MyColors.LIGHT_PINK),
                          ),
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

                      ///ID Back Side
                      Column(
                        children: [
                          Text(
                            "Front Side ",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Itim-Regular',
                                color: MyColors.LIGHT_PINK),
                          ),
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
                      "ID Information",
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
                          controller: idNameController,
                          hint: "ID Name",
                          important: true)),
                  Divider(
                    color: MyColors.GREEN_LIGHT_SHADE,
                  ),
                  leftAndRightPadding(
                      child: myCustomTextFiled(
                          context: context,
                          controller: idNameController,
                          hint: "ID Number",
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
