import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';

class SellerAddPet extends StatefulWidget {
  const SellerAddPet({Key? key}) : super(key: key);

  @override
  State<SellerAddPet> createState() => _SellerAddPetState();
}

class _SellerAddPetState extends State<SellerAddPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }

  /// Mobile UI
  Widget mobile(BuildContext context) {
    return SingleChildScrollView(
      child: leftAndRightPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///Heading
            Text("Add Pet" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),

          ],
        ),
      ),
    );
  }

  /// Tablet UI
  Widget tablet(BuildContext context) {
    return Center(
      child: Text("In Design Process"),
    );
  }

  /// Web UI
  Widget web(BuildContext context) {
    return Center(
      child: Text("In Design Process"),
    );
  }
}
