import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pet_paradise/blogs_module/module/blog_module.dart';
import 'package:pet_paradise/blogs_module/pages/add_blog.dart';
import 'package:pet_paradise/firebase_services/firebase_helper.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

import '../../authentication_module/module/app_user.dart';
import '../../custom_widgets/custom_widgets.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';

class BloggerDashboard extends StatefulWidget {
  late final _appUser;
  late final _query;

  BloggerDashboard({Key? key, required GeneralAppUser appUser}) : super(key: key) {
    this._appUser = appUser;
  }

  @override
  State<BloggerDashboard> createState() => _BloggerDashboardState();
}

class _BloggerDashboardState extends State<BloggerDashboard> {
  @override
  void initState() {
    super.initState();
    widget._query = FirebaseHelper.BLOGS_REF;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(context: context),
      extendBodyBehindAppBar: true,
      body: Responsive(
        mobile: mobile(context),
        tablet: tabletUI(),
        web: webUI(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddBlog(appUser: widget._appUser)));
          },
          backgroundColor: MyColors.YELLOW,
          child: Icon(
            Icons.add,
            color: MyColors.MATERIAL_LIGHT_GREEN,
          ),
          tooltip: "Add new Blog.",
        ),
      ),
    );
  }

  ///mobile
  Widget mobile(context) {
    return Stack(
      children: [
        backgroundWidget(),

        ///Header
        Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "${widget._appUser.userName}",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                  )
                ],
              )
            ],
          ),
        ),

        /// List of Blogs
        Padding(
          padding: EdgeInsets.only(top: 200),
          child: FirebaseAnimatedList(
              query: widget._query,
              itemBuilder: (context, dataSnapshot, animation, index) {
                var jsonValue = dataSnapshot.value;
                Blog userBlog = Blog.fromJson(jsonValue);
                print(userBlog.writerId);
                if (userBlog.writerId == widget._appUser.uid) {
                  return blogCard(userBlog);
                } else {
                  return Container(
                    child: Center(
                      child: clickAbleText(
                          text: "No Blog Published", onTap: () {}),
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }

  ///blog card
  Widget blogCard(Blog blog) {
    return Padding(
      padding: EdgeInsets.only(
          left: MyAppSize.width! * 0.05,
          right: MyAppSize.width! * 0.05,
          bottom: 10),
      child: Card(
        color: MyColors.LIGHT_GREEN,
        child: Container(
          height: 170,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [MyColors.GREEN40, MyColors.GRADIENT_YELLOW],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      blog.blogImgURL,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(blog.blogTitle)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "${blog.numberOfReads} Reads",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
