import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/utils/colors.dart';

import '../utils/size_config.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  //Card Data To Show On Dashboard

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
      extendBodyBehindAppBar: true,
      body: Responsive(
        mobile: mobile(context),
        web: web(context),
        tablet: tablet(context),
      ),
    );
  }
}

//TODO : Mobile UI

Widget mobile(BuildContext context) {
  return Stack(
alignment: Alignment.topRight,
    children: [
      Image(image: AssetImage("assets/images/rectDesign.png"),alignment: Alignment.topCenter,),
      CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          myDashboardAppBar(title: "Hello User!"),
          SliverPadding(
              padding: EdgeInsets.only(
                  left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),sliver: myDashboardGrid()),

        ],
      ),
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

// Appbar
SliverAppBar myDashboardAppBar({required String title}) {
  return SliverAppBar(
    
    pinned: true,
    floating: false,
    elevation: 0,
    expandedHeight: 200,
    backgroundColor: Colors.white10,
    leading: Icon(Icons.arrow_back, color: MyColors.LIGHT_GREEN),
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: [StretchMode.zoomBackground,StretchMode.blurBackground],
      title: Text(
        "$title",
        style: TextStyle(
            fontSize: 17, color: MyColors.DARK_GREEN, fontWeight: FontWeight.bold),
      ),
      titlePadding: EdgeInsets.all(16),
centerTitle: true,
      background: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/logo.png"),height: 98,width: 127,
          ),
        ],
      ),
      collapseMode: CollapseMode.parallax,
    ),

  );
}

// Dashboard Grid
SliverGrid myDashboardGrid() {
  List<MyDashboardCardData> gridCardData = generateCardData();
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 239,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2),
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Card(
        elevation: 1,
        shadowColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          splashColor: MyColors.LIGHT_GREEN,
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 4,
                  child:
                      Image(image: AssetImage(gridCardData[index]._imgPath))),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gridCardData[index]._title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColors.DARK_BROWN,
                      fontSize: 21,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                ),
              ))
            ],
          ),
        ),
      );
    }, childCount: gridCardData.length),
  );
}

//Card Data Module
class MyDashboardCardData {
  late final String _imgPath;
  late final String _title;

  MyDashboardCardData({required String imgPath, required String title}) {
    this._imgPath = imgPath;
    this._title = title;
  }

  String get title => _title;

  String get imgPath => _imgPath;
}

//generate card Data List
List<MyDashboardCardData> generateCardData() {
  return <MyDashboardCardData>[
    MyDashboardCardData(
        title: "Trainers", imgPath: "assets/images/trainerLogo.png"),
    MyDashboardCardData(
        title: "Veterinarians", imgPath: "assets/images/veterinariansLogo.png"),
    MyDashboardCardData(
        title: "Breeders", imgPath: "assets/images/breedersLogo.png"),
    MyDashboardCardData(
        title: "Pet Panda", imgPath: "assets/images/petPandaLogo.png"),
    MyDashboardCardData(
        title: "Adopt A Pet", imgPath: "assets/images/adoptPetLogo.png"),
    MyDashboardCardData(
        title: "Blogs & Articles",
        imgPath: "assets/images/blogs&ArticlesLogo.png"),
  ];
}
