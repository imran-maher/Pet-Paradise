import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/module/app_user.dart';
import 'package:pet_paradise/module/get_started_page_data.dart';
import 'package:pet_paradise/pages/get_started_page.dart';

import '../utils/colors.dart';
import '../utils/size_config.dart';

class MainDashboardPage extends StatefulWidget {
  late final AppUser _appUser;

  MainDashboardPage({Key? key, required AppUser appUser}) : super(key: key) {
    this._appUser = appUser;
  }

  static const TRAINER = "Trainer";
  static const VET = "Veterinarian";
  static const BREEDER = "Breeder";
  static const PET_PANDA = "Pet Panda";
  static const ADOPT_A_PET = "Adopt A Pet";
  static const BLOGS_AND_ARTICLES = "Blogs & Articles";

  //Get Started with Blog Page Data
  static final GetStartedPageData getStartedWithBlogs = GetStartedPageData(
      pageTitle: "Blogs & Articles",
      subTitle: "Publish Your Own  Passion In Your Own Way ",
      imgUrl:
          "https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80");

  //Get Started with Adopt a pet Page Data
  static final GetStartedPageData getStartedWithAdoptAPet = GetStartedPageData(
      pageTitle: "MAKE  A NEW FRIEND",
      subTitle:
          "Instant access to thousands of veterans.You may simply get in touch with them and schedule appointments at times that work for you.",
      imgUrl:
          "https://images.unsplash.com/photo-1450778869180-41d0601e046e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=986&q=80");

  //Get Started with Breeder Page Data
  static final GetStartedPageData getStartedWithBreeder = GetStartedPageData(
      pageTitle: "FIND THE BEST BREEDER FOR YOUR PET",
      subTitle:
          "Instant access to thousands of Breeders. You may simply get in touch with them and schedule appointments at times that work for you.",
      imgUrl:
          "https://images.unsplash.com/photo-1602612142771-04b0adfca46d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  //Get Started with Trainer Page Data
  static final GetStartedPageData getStartedWithTrainer = GetStartedPageData(
      pageTitle: "FIND THE BEST TRAINER FOR YOUR PET",
      subTitle:
          "Instant access to thousands of trainers.You may simply get in touch with them and schedule appointments at times that work for you.",
      imgUrl:
          "https://images.unsplash.com/photo-1484190929067-65e7edd5a22f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  //Get Started with Vet Page Data
  static final GetStartedPageData getStartedWithVet = GetStartedPageData(
      pageTitle: "FIND THE BEST VETERINARIAN FOR YOUR PET",
      subTitle:
          "Instant access to thousands of veterans.You may simply get in touch with them and schedule appointments at times that work for you.",
      imgUrl:
          "https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      body: Responsive(
        mobile: mobile(context, widget._appUser),
        web: web(context),
        tablet: tablet(context),
      ),
    );
  }
}

//TODO : Mobile UI

Widget mobile(BuildContext context, AppUser appUser) {
  return CustomScrollView(
    physics: BouncingScrollPhysics(),
    slivers: [
      myDashboardAppBar(title: "Hello ${appUser.userName}!", appUser: appUser),
      SliverPadding(
        padding: EdgeInsets.only(
            left: MyAppSize.width! * 0.05,
            right: MyAppSize.width! * 0.05,
            bottom: MyAppSize.height! * 0.05),
        sliver: myDashboardGrid(),
      )
    ],
  );
}

//TODO : Tablet UI
Widget tablet(BuildContext context) {
  return Center(child: Text("In Designing Process"));
}

//TODO : Web UI
Widget web(BuildContext context) {
  return Center(child: Text("In Designing Process"));
}

// Appbar
SliverAppBar myDashboardAppBar(
    {required String title, required AppUser appUser}) {
  return SliverAppBar(
    title: Text(
      title,
      style: TextStyle(
          fontSize: 16, color: Colors.white, fontFamily: 'Itim-Regular'),
    ),
    pinned: false,
    elevation: 5,
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          maxRadius: 30,
        ),
      )
    ],
    expandedHeight: 200,
    backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
    flexibleSpace: FlexibleSpaceBar(
      background: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 14,right: 16),
              child: Text(
                "Dear ${appUser.userName} You Have Registered 5 Pets",
                style: TextStyle(fontFamily: 'Itim-Regular',fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
                onPressed: () {},
                title: 'Your Pets Here',
                color: Colors.yellow,
                textColor: Colors.black,
                height: 45),
          )
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
        mainAxisExtent: 250,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2),
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Card(
          elevation: 1,
          shadowColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            splashColor: MyColors.MATERIAL_LIGHT_GREEN,
            onTap: () {
              if (gridCardData[index].title == MainDashboardPage.TRAINER) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetStartedPage(
                            pageData: MainDashboardPage.getStartedWithTrainer)));
              } else if (gridCardData[index].title == MainDashboardPage.VET) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetStartedPage(
                            pageData: MainDashboardPage.getStartedWithVet)));
              } else if (gridCardData[index].title == MainDashboardPage.BREEDER) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetStartedPage(
                            pageData: MainDashboardPage.getStartedWithBreeder)));
              } else if (gridCardData[index].title ==
                  MainDashboardPage.ADOPT_A_PET) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetStartedPage(
                            pageData:
                                MainDashboardPage.getStartedWithAdoptAPet)));
              } else if (gridCardData[index].title ==
                  MainDashboardPage.BLOGS_AND_ARTICLES) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetStartedPage(
                            pageData: MainDashboardPage.getStartedWithBlogs)));
              }
            },
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
                        fontSize: 17,
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
        title: MainDashboardPage.TRAINER,
        imgPath: "assets/images/trainerLogo.png"),
    MyDashboardCardData(
        title: MainDashboardPage.VET,
        imgPath: "assets/images/veterinariansLogo.png"),
    MyDashboardCardData(
        title: MainDashboardPage.BREEDER,
        imgPath: "assets/images/breedersLogo.png"),
    MyDashboardCardData(
        title: MainDashboardPage.PET_PANDA,
        imgPath: "assets/images/petPandaLogo.png"),
    MyDashboardCardData(
        title: MainDashboardPage.ADOPT_A_PET,
        imgPath: "assets/images/adoptPetLogo.png"),
    MyDashboardCardData(
        title: MainDashboardPage.BLOGS_AND_ARTICLES,
        imgPath: "assets/images/blogs&ArticlesLogo.png"),
  ];
}
