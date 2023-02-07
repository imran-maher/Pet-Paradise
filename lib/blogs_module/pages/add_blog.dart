import 'package:flutter/material.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

class AddBlog extends StatefulWidget {
  late final String _userID;

  AddBlog({Key? key, required String userID}) : super(key: key) {
    this._userID = userID;
  }

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile: mobile(context, widget._userID),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///mobile UI
  Widget mobile(BuildContext context, String userId) {
    return Stack(
      children: [
        backgroundWidget(),
      ],
    );
  }
}
