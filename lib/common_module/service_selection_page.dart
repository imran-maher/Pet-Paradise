import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/module/service_providers.dart';
import 'package:pet_paradise/utils/colors.dart';

class ServiceSelectionPage extends StatelessWidget {
  const ServiceSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
          context: context, centerTitle: "Services Selection"),
      body: Responsive(
        mobile: mobile(context),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  /// mobile UI
  Widget mobile(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///Service Providers
            ///Trainer
            MyButton(
                onPressed: () {},
                title: ServiceProviders.TRAINER,
                color: MyColors.GREEN,
                textColor: Colors.white),
            SizedBox(
              height: 20,
            ),

            ///Breeder
            MyButton(
                onPressed: () {},
                title: ServiceProviders.BREEDER,
                color: MyColors.GREEN,
                textColor: Colors.white),
            SizedBox(
              height: 20,
            ),

            ///Vet
            MyButton(
                onPressed: () {},
                title: ServiceProviders.VET,
                color: MyColors.GREEN,
                textColor: Colors.white),
          ],
        ),
      ],
    );
  }

}
