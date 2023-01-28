import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller/pages/seller_add_Id_info_page.dart';
import 'package:pet_paradise/seller/pages/seller_corporated_info_page.dart';
import 'package:pet_paradise/utils/colors.dart';

class SellerBusinessTypeSelectionPage extends StatelessWidget {
  const SellerBusinessTypeSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,
      appBar:
          transparentAppBar(context: context, centerTitle: "Verify ID & bank "),
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }

  ///mobile
  Widget mobile(BuildContext context) {
    return leftAndRightPadding(
      child: Column(
        children: [
          ///Card For Individual Reg
          GestureDetector(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SellerAddIDInfoPage() ));
          },
            child: Card(
              child: Container(
                height: 150,
                child: leftAndRightPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Center(
                            child: Text("Register as individual" , style: TextStyle(fontFamily: 'Itim-Regular',fontSize: 13,fontWeight: FontWeight.bold),),
                          )),
                      Divider(
                        color: MyColors.GREEN_LIGHT_SHADE,
                      ),
                      SizedBox(height: 15,),
                      Text(
                          "Most sellers on Pet Paradise fall into this category.",style: TextStyle(fontFamily: 'Itim-Regular',fontSize: 12,color: Colors.grey),),
                      SizedBox(height: 15,),
                      Text("Learn More" ,style: TextStyle(fontFamily: 'Itim-Regular',fontSize: 12,color: Colors.indigo),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ///Card For Corporate  Reg
          GestureDetector(  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SellerCorporatedInfoPage() ));},
            child: Card(
              child: Container(
                height: 150,
                child: leftAndRightPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Center(
                            child: Text("Register as incorporated business" , style: TextStyle(fontFamily: 'Itim-Regular',fontSize: 13,fontWeight: FontWeight.bold),),
                          )),
                      Divider(
                        color: MyColors.GREEN_LIGHT_SHADE,
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "A registered legal entity (a sole trader is considered a legal entity)",style: TextStyle(fontFamily: 'Itim-Regular',fontSize: 12,color: Colors.grey),),
                      SizedBox(height: 15,),
                      Text("Learn More" ,style: TextStyle(fontFamily: 'Itim-Regular',fontSize: 12,color: Colors.indigo),),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  ///Tablet
  Widget tablet(BuildContext context) {
    return Center(
      child: Text("In Designing Process"),
    );
  }

  ///Web
  Widget web(BuildContext context) {
    return Center(
      child: Text("In Designing Process"),
    );
  }
}
