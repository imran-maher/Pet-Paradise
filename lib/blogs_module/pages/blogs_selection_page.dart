import 'package:flutter/material.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';


import '../../utils/responsive_controller.dart';

class BlogSelectionPage extends StatefulWidget {
  const BlogSelectionPage({Key? key}) : super(key: key);

  @override
  State<BlogSelectionPage> createState() => _BlogSelectionPageState();
}

class _BlogSelectionPageState extends State<BlogSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(context: context),
      body: Responsive(mobile: mobile(context),tablet: tabletUI(),web: webUI(),),
    );
  }
  
  ///mobile
 Widget mobile(context){
     return Stack(
       children: [
         backgroundWidget(),
       ],
     );
 }
}
