import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_paradise/utils/colors.dart';

import '../controllers/responsive_controller.dart';
import '../utils/size_config.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
        body: Responsive(
            mobile: mobile(context),
            tablet: tablet(context),
            web: web(context)));
  }
}

//TODO : Mobile UI

Widget mobile(BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        leading: Icon(Icons.arrow_back, color: Colors.white,),
        backgroundColor: MyColors.LIGHT_GREEN,
        expandedHeight: 300,
        floating: true,
        pinned: true,

        flexibleSpace: FlexibleSpaceBar(
          background: Image(image: AssetImage("assets/images/logo.png"),),
          title: Text("Hello User", style: TextStyle(color: Colors.white),),

        ),
      ),
      SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 100,
              child: Card(child: Text("Text ${index+1}"),),
            ),
          );
        }, childCount: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 0,mainAxisSpacing: 0),
      )
    ],
  );
}

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
