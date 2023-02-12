import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import 'package:pet_paradise/service_provider_module/module/service_providers.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

import '../../utils/colors.dart';

class ServiceProviderDashboard extends StatefulWidget {
  late final GeneralAppUser _generalAppUser;
  late final ServiceProvider _serviceProvider;

  ServiceProviderDashboard(
      {Key? key,
      required GeneralAppUser generalAppUser,
      required ServiceProvider serviceProvider})
      : super(key: key) {
    this._serviceProvider = serviceProvider;
    this._generalAppUser = generalAppUser;
  }

  @override
  State<ServiceProviderDashboard> createState() =>
      _ServiceProviderDashboardState();
}

class _ServiceProviderDashboardState extends State<ServiceProviderDashboard> {
  List screens = List.empty(growable: true);
  int selectedScreen = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens.add(homeBody(serviceProvider: widget._serviceProvider));
    screens.add(inboxBody());
    screens.add(profileBody());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedScreen,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          backgroundColor: MyColors.BOTOM_NAV_COLOR,
          onTap: (index) {
            setState(() {
              print(index);
              selectedScreen = index;
            });
          },
          selectedItemColor: MyColors.MATERIAL_LIGHT_GREEN),
      body: Responsive(
        mobile: screens[selectedScreen],
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///Home body
  Widget homeBody({required ServiceProvider serviceProvider}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: GestureDetector(
                      onTap: (){},
                      child: CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(widget._serviceProvider.imgUrl),
                ),
                    ))
              ]),
        )
      ],
    );
  }

  ///inbox body
  Widget inboxBody() {
    return Column();
  }

  ///profile Body
  Widget profileBody() {
    return Column();
  }
}
