import 'package:flutter/material.dart';
import 'package:pet_paradise/blogs_module/module/blog_module.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

class BlogReadingPage extends StatefulWidget {
  late final Blog _blog;

  BlogReadingPage({Key? key, required Blog blog}) : super(key: key) {
    this._blog = blog;
  }

  @override
  State<BlogReadingPage> createState() => _BlogReadingPageState();
}

class _BlogReadingPageState extends State<BlogReadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: mobile(context),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///Mobile UI
  Widget mobile(context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,

          expandedHeight: 200,
          backgroundColor: Colors.white,
          title: Text(widget._blog.blogTitle),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                  color: MyColors.MATERIAL_LIGHT_GREEN,
                  image: DecorationImage(
                      image: NetworkImage(widget._blog.blogImgURL),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ),
        ),

        SliverFillRemaining(child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("${widget._blog.blogContent}",style: TextStyle(fontSize: 20),),
        ),),

      ],

    );
  }
}
