import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import 'package:pet_paradise/blogs_module/module/blog_module.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';

import '../../utils/responsive_controller.dart';

class BlogSelectionPage extends StatefulWidget {
  late final AppUser _appUser;
 late final List<Blog> _blogsList;
   BlogSelectionPage({Key? key , required appUser,required List<Blog> blogsList}) : super(key: key){
    this._appUser = appUser;
    this._blogsList = blogsList;
  }

  @override
  State<BlogSelectionPage> createState() => _BlogSelectionPageState();
}

class _BlogSelectionPageState extends State<BlogSelectionPage> {
  // The key to be used when accessing SliverAnimatedListState
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  late List<Blog> blogsList;
  @override
  Widget build(BuildContext context) {
    print("Build with ${widget._blogsList.length} blogs");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Responsive(
        mobile: mobile(context),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///mobile
  Widget mobile(context) {
    return Stack(
      children: [
        backgroundWidget(),
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              pinned: false,
              automaticallyImplyLeading: false,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  child: leftAndRightPadding(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Blogs"),
                          Text("Your Blogs here"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 55,
                        child: TextField(
                          decoration: InputDecoration(
                            prefix: Icon(
                              Icons.search,
                              color: MyColors.GREEN_LIGHT_SHADE,
                            ),
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 20),
              sliver:
                  SliverAnimatedList(itemBuilder: (context, index, anination) {
                return Container();
              }),
            )
          ],
        ),
      ],
    );
  }

  ///fetch blogs from database

}
