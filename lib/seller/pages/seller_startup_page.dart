import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

class SellerStartUpPage extends StatelessWidget {
  const SellerStartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //TODO : Mobile
  Widget mobile(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MyAppSize.width,
          child: Image(
            image: AssetImage("assets/images/rectDesign.png"),
            alignment: Alignment.topRight,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Logo Image
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                      height: 180,
                      width: 180,
                      child: Image(
                          image: AssetImage(
                        "assets/images/logo.png",
                      ))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

//TODO : Tablet
  Widget tablet(BuildContext context) {
    return Center(
      child: Text("In Designing Process"),
    );
  }

//TODO : Web
  Widget web(BuildContext context) {
    return Center(
      child: Text("In Designing Process"),
    );
  }
}
