import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';

class SellerBusinessTypeSelectionPage extends StatelessWidget {
  const SellerBusinessTypeSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,
      appBar:
          transparentAppBar(context: context, centerTitle: "Business Type "),
      body: Responsive(
        mobile: mobile(context),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///mobile
  Widget mobile(BuildContext context) {
    return Column();
  }
}
