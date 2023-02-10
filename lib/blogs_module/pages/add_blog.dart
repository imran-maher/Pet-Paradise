import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import 'package:pet_paradise/blogs_module/module/blog_module.dart';

import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/custom_widgets/dailogs.dart';
import 'package:pet_paradise/firebase_services/firebase_helper.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

class AddBlog extends StatefulWidget {
  late final AppUser _appUser;
  late final ImagePicker _imagePicker;
  late final String blogID;
  late final String imgUrl;
  late File? imgFile = null;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  AddBlog({Key? key, required AppUser appUser}) : super(key: key) {
    this._appUser = appUser;
  }

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  @override
  void initState() {
    super.initState();

    widget._imagePicker = ImagePicker();
    widget.blogID = FirebaseHelper.BLOGS_REF.push().key.toString();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.blogID);
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
                  controller: widget._titleController,
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
                GestureDetector(
                  onTap: () async {
                    getImgFromGallery();
                  },
                  child: Container(
                    color: MyColors.GREEN40,
                    height: 100,
                    child: Center(
                      child: widget.imgFile?.path == null
                          ? Icon(Icons.add_a_photo)
                          : Image(image: FileImage(widget.imgFile!)),
                    ),
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
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      controller: widget._contentController,
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
                SizedBox(
                  height: 20,
                ),
                MyButton(
                    onPressed: () async {
                      CustomProgressIndicatorDialog(context: context);
                      if (widget._contentController.text.isNotEmpty &&
                          widget._titleController.text.isNotEmpty &&
                          widget.imgFile?.path != null) {
                        uploadImageToFireStore(context).then((value) {
                          print("VAL $value");
                          if (widget.imgUrl.isNotEmpty) {
                            Blog blog = Blog(
                                widget._appUser.uid,
                                widget.blogID,
                                widget._titleController.text,
                                widget._contentController.text,
                                value,
                                0,
                                0);
                            FirebaseHelper.BLOGS_REF
                                .child(widget.blogID)
                                .set(Blog.toMap(blog))
                                .whenComplete(() {
                              Navigator.pop(context);
                              Navigator.of(context).pop();

                            });
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Something went Wrong",
                              ),
                              backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
                            ));
                          }
                        });

                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Kindly Fill All Fields",
                          ),
                          backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
                        ));
                      }
                    },
                    title: "Upload Your Blog",
                    color: MyColors.GREEN_LIGHT_SHADE,
                    textColor: Colors.black,
                    borderRadius: 0)
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<String> uploadImageToFireStore(context) async {
    CustomProgressIndicatorDialog(context: context);
    print("asdf ${widget.imgFile?.path}");
    var ref = FirebaseStorage.instance.ref("blog-images");

    try {
      ref
          .child("blog-images/${widget.blogID}")
          .putFile(widget.imgFile!)
          .then((value) {
        ref
            .child("blog-images/${widget.blogID}")
            .getDownloadURL()
            .then((value) {
          Navigator.pop(context);
          widget.imgUrl = value;

        });
      });
    } catch (e) {
      print(e.toString());
    }
    return ref.child("blog-images/${widget.blogID}").getDownloadURL();
  }

  getImgFromGallery() async {
    try {
      var pickedFile =
          await widget._imagePicker.pickImage(source: ImageSource.gallery);

      widget.imgFile = File(pickedFile!.path);

      setState(() {
        print("Image Picker path:${widget.imgFile?.path} ");
      });
    } catch (e) {
      print("Image Picker Error : ${e.toString()}");
    }
  }
}
