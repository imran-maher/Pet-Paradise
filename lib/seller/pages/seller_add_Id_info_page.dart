import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';

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
        tablet: tablet(context),
        web: web(context),
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
              Divider(
                color: Colors.red,
                height: 55,
                endIndent: 15,
              ),
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
              height: 150,
              child:  Column(
                  children: [
                    leftAndRightPadding(child: importantText(text: "ID Documents",fontSize: 18,textColor: Colors.black)),
                    Divider(color: MyColors.GREEN_LIGHT_SHADE,)
                  ],
                ),
              ),  
            ),
        
        ],
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
