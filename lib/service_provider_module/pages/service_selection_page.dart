import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/service_provider_module/module/service_providers.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/size_config.dart';

class ServiceSelectionPage extends StatelessWidget {
  const ServiceSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        Padding(
          padding:  EdgeInsets.only(left: MyAppSize.width! * 0.05 ,right: MyAppSize.width! * 0.05 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ///Service Providers
              ///Trainer
              MyButton(
                  onPressed: () {},
                  title: ServiceProviders.TRAINER,
                  color: MyColors.MATERIAL_LIGHT_GREEN,
                  textColor: Colors.white),
              SizedBox(
                height: 20,
              ),

              ///Breeder
              MyButton(
                  onPressed: () {},
                  title: ServiceProviders.BREEDER,
                  color: MyColors.MATERIAL_LIGHT_GREEN,
                  textColor: Colors.white),
              SizedBox(
                height: 20,
              ),

              ///Vet
              MyButton(
                  onPressed: () {},
                  title: ServiceProviders.VET,
                  color: MyColors.MATERIAL_LIGHT_GREEN,
                  textColor: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

}
