import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';

import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';

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
      extendBodyBehindAppBar: true,
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
        SingleChildScrollView(
          child: leftAndRightPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/add_blog_logo.png",
                    height: 120,
                    width: 120,
                  ),
                ),
                Text(
                  "Create a blog and everyone will be able to read it. Inform people of your knowledge about your pet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),

                ///Add Title TextField
                Text(
                  "Title",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyColors.GREEN40, width: 0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyColors.GREEN40, width: 0)),
                      hintText: "Blog Title",
                      filled: true,
                      fillColor: MyColors.GREEN40),
                ),
                SizedBox(
                  height: 20,
                ),

                ///Add Image
                Text(
                  "Upload a picture",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: MyColors.GREEN40,
                  height: 100,
                  child: Center(
                    child: Icon(Icons.add_a_photo),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                ///Add blog Content
                Text(
                  "Write Something",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: MyColors.GREEN40,
                  height: 170,
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      maxLines: 7,
                      maxLength: 1500,

                      decoration: InputDecoration(


                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: MyColors.GREEN40, width: 0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: MyColors.GREEN40, width: 0)),
                        hintText: "Blog Content",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                MyButton(onPressed: (){}, title: "Upload Your Blog", color: MyColors.GREEN_LIGHT_SHADE, textColor: Colors.black,borderRadius: 0)
              ],
            ),
          ),
        )
      ],
    );
  }
}
