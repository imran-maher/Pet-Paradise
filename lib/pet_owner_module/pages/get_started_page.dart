import 'package:flutter/material.dart';
import 'package:pet_paradise/blogs_module/pages/blogs_selection_page.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/pet_owner_module/module/get_started_page_data.dart';
import 'package:pet_paradise/utils/colors.dart';
import '../../utils/size_config.dart';

class GetStartedPage extends StatelessWidget {
  late final GetStartedPageData _pageData;

  GetStartedPage({Key? key, required GetStartedPageData pageData})
      : super(key: key) {
    this._pageData = pageData;
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MyColors.MATERIAL_LIGHT_GREEN,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Responsive(
        mobile: mobile(context, pageData: this._pageData),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  /// Mobile
  Widget mobile(BuildContext context, {required GetStartedPageData pageData}) {
    return Stack(
      children: [
        Container(
          width: MyAppSize.width,
          child: Image(
            image: AssetImage("assets/images/rectDesign.png"),
            alignment: Alignment.topRight,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MyAppSize.width! * 0.1,
                    right: MyAppSize.width! * 0.1),
                child: Text(
                  pageData.pageTitle,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MyColors.DARK_BROWN),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 340,
                width: MyAppSize.width,
                child: CircleAvatar(
                  backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
                  backgroundImage: NetworkImage(pageData.imageUrl),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MyAppSize.width! * 0.1,
                    right: MyAppSize.width! * 0.1),
                child: Text(
                  pageData.pageSubTitle,
                  style: TextStyle(
                      color: MyColors.LIGHT_PINK,
                      fontStyle: FontStyle.italic,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MyAppSize.height! * 0.08),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              onPressed: () {
                if(pageData.pageTitle == GetStartedPageData.BLOGS_AND_ARTICLES){
                  navigateToiNextScreen(context, BlogSelectionPage());
                }
              },
              color: MyColors.MATERIAL_LIGHT_GREEN,
              height: 39,
              minWidth: MyAppSize.width,
              child: Text(
                "Get Started",
              ),
            ),
          ),
        )
      ],
    );
  }
  
  /// Navigate To NextScreen 
  navigateToiNextScreen(BuildContext context , var screen){
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
