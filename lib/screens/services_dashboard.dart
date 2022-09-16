import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/utils/colors.dart';
import '../custom_widgets/custom_widgets.dart';
import '../utils/size_config.dart';

class ServicesDashboard extends StatefulWidget {
  const ServicesDashboard({Key? key}) : super(key: key);

  @override
  State<ServicesDashboard> createState() => _ServicesDashboardState();
}

class _ServicesDashboardState extends State<ServicesDashboard> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold();
  }
}

//TODO : Mobile UI

Widget mobile(BuildContext context){return Container();}

//TODO : TABLET UI
Widget tablet(BuildContext context) {
  return Center(
    child: Text("In Designing Process"),
  );
}
//TODO : Web UI
Widget web(BuildContext context) {
  return Center(
    child: Text("In Designing Process"),
  );
}
