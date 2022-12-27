import 'package:flutter/material.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';

class SellerAddIdPage extends StatefulWidget {
  const SellerAddIdPage({Key? key}) : super(key: key);

  @override
  State<SellerAddIdPage> createState() => _SellerAddIdPageState();
}

class _SellerAddIdPageState extends State<SellerAddIdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,appBar: transparentAppBar(context: context),);
  }
}
