import 'package:flutter/material.dart';

import '../controllers/responsive_controller.dart';
import '../utils/colors.dart';
import '../utils/size_config.dart';

class BlogsDashboard extends StatefulWidget {
  const BlogsDashboard({Key? key}) : super(key: key);

  @override
  State<BlogsDashboard> createState() => _BlogsDashboardState();
}

class _BlogsDashboardState extends State<BlogsDashboard> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }
}

//Mobile
Widget mobile(BuildContext context) {
  return
    CustomScrollView(
    slivers: [
      sliverAppBar(),
      blogsListView(context),
    ],
  );
}

//Tablet
Widget tablet(BuildContext context) {
  return Center(
    child: Text("Designing Process"),
  );
}

//Web
Widget web(BuildContext context) {
  return Center(
    child: Text("Designing Process"),
  );
}

//Sliver App bar for blogs dashboard
SliverAppBar sliverAppBar() {
  return SliverAppBar(
    scrolledUnderElevation: 10,
    floating: true,
    expandedHeight: 200,
    leading: Icon(
      Icons.arrow_back,
      color: MyColors.DARK_BROWN,
    ),
    backgroundColor: MyColors.YELLOW,
    elevation: 0,
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //TODO : Header Row
          Padding(
            padding: EdgeInsets.only(
                left: MyAppSize.width! * 0.1,
                right: MyAppSize.width! * 0.1,
                top: 80,
                bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blogs",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: MyColors.LIGHT_GREEN),
                ),
                Text(
                  "Share your pieces!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          //TODO : Search Option
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MyAppSize.width! * 0.05),
            child: Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder()),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//blogs listview
SliverList blogsListView(BuildContext context) {
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return ListTile(
        title: Text("Count $index"),
      );
    }, childCount: 50),
  );
}
