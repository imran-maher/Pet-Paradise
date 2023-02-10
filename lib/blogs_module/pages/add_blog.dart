import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import 'package:pet_paradise/blogs_module/module/blog_module.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/firebase_services/firebase_helper.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

class AddBlog extends StatefulWidget {
  late final AppUser _appUser;

  AddBlog({Key? key, required AppUser appUser}) : super(key: key) {
    this._appUser = appUser;
  }

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String? blogKey = FirebaseHelper.BLOGS_REF.push().key;
          Blog blog = Blog(widget._appUser.uuid, blogKey.toString(), "Blog Title",
              "Blog Content is here ", "asdfsdf", 0, 0);
          FirebaseHelper.BLOGS_REF.child(blogKey!).set(Blog.toMap(blog));

        },
      ),
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile: mobile(context, widget._appUser),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///mobile UI
  Widget mobile(BuildContext context, AppUser appUser) {
    return Stack(
      children: [
        backgroundWidget(),
      ],
    );
  }
}
