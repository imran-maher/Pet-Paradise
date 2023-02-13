import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import 'package:pet_paradise/service_provider_module/module/service_providers.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

import '../../utils/colors.dart';

class ServiceProviderDashboard extends StatefulWidget {
  late final GeneralAppUser _generalAppUser;
  late final ServiceProvider _serviceProvider;
  late final  List _pages;

  ServiceProviderDashboard(
      {Key? key,
      required GeneralAppUser generalAppUser,
      required ServiceProvider serviceProvider,required List<Widget> pages})
      : super(key: key) {
    this._serviceProvider = serviceProvider;
    this._generalAppUser = generalAppUser;
    this._pages = pages;
  }

  @override
  State<ServiceProviderDashboard> createState() =>
      _ServiceProviderDashboardState();
}

class _ServiceProviderDashboardState extends State<ServiceProviderDashboard> {
  int selectedPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
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
              selectedPage = index;
            });
          },
          selectedItemColor: MyColors.MATERIAL_LIGHT_GREEN),
      body: Responsive(
        mobile: widget._pages[selectedPage],
        tablet: tabletUI(),
        web: webUI(),
      ),
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
