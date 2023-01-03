//TODO : Seller Home Page under Working

import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/custom_widgets/seller_bottom_nav.dart';

import 'package:pet_paradise/seller/module/seller_info.dart';
import 'package:pet_paradise/seller/pages/seller_add_Id_info_page.dart';
import 'package:pet_paradise/seller/pages/seller_add_address_page.dart';
import 'package:pet_paradise/seller/pages/seller_profile_page.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/size_config.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({Key? key}) : super(key: key);

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(context: context, centerTitle: "Home"),
      bottomNavigationBar: SellerBottomNavBar(),
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }

  /// Mobile UI
  Widget mobile(BuildContext context) {
    List<TileData> tileDataList =[
      TileData(
          tileActive: true,
          tileTitle: TileData.ADD_PROFILE,
          trailingIconData: Icons.arrow_forward_ios),
      TileData(
          tileActive: true,
          tileTitle: TileData.ADD_ADDRESS,
          trailingIconData: Icons.arrow_forward_ios),
      TileData(
          tileActive: true,
          tileTitle: TileData.VERIFY_ID_BANK,
          trailingIconData: Icons.arrow_forward_ios),
      TileData(
          tileActive: true,
          tileTitle: TileData.ADD_PRODUCT,
          trailingIconData: Icons.arrow_forward_ios)
    ];
    return leftAndRightPadding(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: MyColors.GREEN_LIGHT_SHADE,
      child: Container(
        height: 335,
        width: MyAppSize.width! * 0.9,
        child: leftAndRightPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Please complete the todo as soon as possible, and then start the business journey",
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Itim-Regular',
                    color: Colors.white),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(itemBuilder: (context , index){
                  return tiles(context: context,tileData: tileDataList[index], tileNumber: index+1);
                },itemCount: tileDataList.length,),
              ),
            ],
          ),
        ),
      ),
    ));
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

///Tiles Data
class TileData {
  static const ADD_PROFILE = "Add Profile";
  static const ADD_ADDRESS = "Add Address";
  static const VERIFY_ID_BANK = "Verify ID & Bank";
  static const ADD_PRODUCT = "Add Products";

  late final String _tileTitle;
  late final IconData _trailingIconData;
  late final bool _tileActive;

  TileData(
      {required bool tileActive,
      required String tileTitle,
      required IconData trailingIconData}) {
    this._trailingIconData = trailingIconData;
    this._tileTitle = tileTitle;
    this._tileActive = tileActive;
  }

  bool get tileActive => _tileActive;

  set tileActive(bool value) {
    _tileActive = value;
  }

  IconData get trailingIconData => _trailingIconData;

  set trailingIconData(IconData value) {
    _trailingIconData = value;
  }

  String get tileTitle => _tileTitle;

  set tileTitle(String value) {
    _tileTitle = value;
  }
}

Widget tiles({required BuildContext context ,required TileData tileData, required int tileNumber}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: GestureDetector(
      onTap: (){
        if(tileData.tileTitle == TileData.ADD_PROFILE){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SellerAddBasicProfileInfoPage(sellerBasicInfo: SellerBasicInfo.init(emailAddress: null, phoneNumber: "03016557355", storeName: null),)));

        }else if(tileData.tileTitle == TileData.ADD_ADDRESS){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SellerAddAddressPage(sellerAddressModule: SellerAddressModule(businessAddress: null , wareHouseAddress: null , returnAddress: null),)));

        }else if(tileData.tileTitle == TileData.VERIFY_ID_BANK){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SellerAddIDInfoPage()));
        }
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: MyColors.LIGHT_GREEN, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              maxRadius: 10,
              backgroundColor: MyColors.GREEN_LIGHT_SHADE,
              child: Center(
                child: Text(tileNumber.toString()),
              ),
            ),
            title: Text(tileData.tileTitle),
            trailing: Icon(tileData.trailingIconData),
          ),
        ),
      ),
    ),
  );
}
