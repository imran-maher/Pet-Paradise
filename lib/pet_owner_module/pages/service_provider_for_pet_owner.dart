import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';

import '../../utils/size_config.dart';

class ServiceProviderForPetOwnerPage extends StatefulWidget {
  late final String serviceType;
  ServiceProviderForPetOwnerPage({Key? key, required String typeOfService}) : super(key: key){
    serviceType = typeOfService;
  }

  @override
  State<ServiceProviderForPetOwnerPage> createState() =>
      _ServiceProviderForPetOwnerPageState();
}

class _ServiceProviderForPetOwnerPageState
    extends State<ServiceProviderForPetOwnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(mobile: mobile(context,widget.serviceType),web: webUI(),tablet: tabletUI(),),
    );
  }

  ///  mobile UI
  Widget mobile(BuildContext context , String serviceType) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 5,
          expandedHeight: 200,
          backgroundColor: Colors.white,
          pinned: false,
          title: Text(serviceType),
          automaticallyImplyLeading: false,
          actions: [CircleAvatar(maxRadius: 30,backgroundColor: Colors.black,)],
          flexibleSpace: FlexibleSpaceBar(
            background:Column(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.center,children: [
              leftAndRightPadding(child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Search"),
              )),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: MyButton(onPressed: (){}, title: "Search", color: MyColors.MATERIAL_LIGHT_GREEN, textColor: Colors.white,width: 120,height: 40),
              )
            ],),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
              left: MyAppSize.width! * 0.05,
              right: MyAppSize.width! * 0.05,
              bottom: MyAppSize.height! * 0.05),
        )
      ],
    );
  }

}
