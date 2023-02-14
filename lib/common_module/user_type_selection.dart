import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import 'package:pet_paradise/custom_widgets/dailogs.dart';
import 'package:pet_paradise/firebase_services/firebase_helper.dart';
import 'package:pet_paradise/pet_owner_module/module/pet_owner_module.dart';
import 'package:pet_paradise/pet_owner_module/pages/pet_owner_dashboard_page.dart';
import 'package:pet_paradise/service_provider_module/pages/home_screen.dart';
import 'package:pet_paradise/service_provider_module/pages/notification_screen.dart';
import 'package:pet_paradise/service_provider_module/pages/profile_screen.dart';
import 'package:pet_paradise/service_provider_module/pages/service_provider_dashboard.dart';
import 'package:pet_paradise/service_provider_module/pages/service_provider_registration_page.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/service_provider_module/module/service_providers.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/size_config.dart';

class UserTypeSelectionPage extends StatelessWidget {
  late final GeneralAppUser _generalAppUser;

  UserTypeSelectionPage({Key? key, required GeneralAppUser generalAppUser})
      : super(key: key) {
    this._generalAppUser = generalAppUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(
          context: context, centerTitle: "Services Selection"),
      body: Responsive(
        mobile: mobile(context: context, generalAppUser: this._generalAppUser),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  /// mobile UI
  Widget mobile(
      {required BuildContext context, required GeneralAppUser generalAppUser}) {
    return Stack(
      children: [
        backgroundWidget(),
        Padding(
          padding: EdgeInsets.only(
              left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Pet Owner
              MyButton(
                  onPressed: () {
                    petOwnerProfileCreation(
                        context: context, generalAppUser: generalAppUser);
                  },
                  title: "Pet Owner",
                  color: MyColors.MATERIAL_LIGHT_GREEN,
                  textColor: Colors.white),
              SizedBox(
                height: 20,
              ),

              ///Service Providers
              ///Trainer
              MyButton(
                  onPressed: () {
                    trainerProfileCreation(
                        context: context, generalAppUser: generalAppUser);
                  },
                  title: ServiceProvider.TRAINER,
                  color: MyColors.MATERIAL_LIGHT_GREEN,
                  textColor: Colors.white),
              SizedBox(
                height: 20,
              ),

              ///Breeder
              MyButton(
                  onPressed: () async {
                    breederProfileCreation(
                        context: context, generalAppUser: generalAppUser);
                  },
                  title: ServiceProvider.BREEDER,
                  color: MyColors.MATERIAL_LIGHT_GREEN,
                  textColor: Colors.white),
              SizedBox(
                height: 20,
              ),

              ///Vet
              MyButton(
                  onPressed: () {
                    vetProfileCreation(
                        context: context, generalAppUser: generalAppUser);
                  },
                  title: ServiceProvider.VET,
                  color: MyColors.MATERIAL_LIGHT_GREEN,
                  textColor: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  ///Select user Pet Owner
  petOwnerProfileCreation(
      {required context, required GeneralAppUser generalAppUser}) async {
    CustomProgressIndicatorDialog(context: context);
    var petOwnerRef = FirebaseHelper.PET_OWNER_DATABASE_REF;
    petOwnerRef.get().then((value) {
      print(value.hasChild(generalAppUser.uid));
      if (value.hasChild(generalAppUser.uid)) {
        value.child(generalAppUser.uid).children.forEach((element) {
          PetOwner petOwner = PetOwner.fromJson(element.value);
          Navigator.pop(context);

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => PetOwnerDashboard(
                  generalAppUser: generalAppUser, petOwner: petOwner)));
        });
      } else {
        var ref =
            FirebaseHelper.PET_OWNER_DATABASE_REF.child(generalAppUser.uid);
        var petOwnerId = ref.push().key;
        PetOwner petOwner =
            PetOwner(petOwnerId: petOwnerId!, profileImgUrl: "No Image");
        ref.child(petOwnerId).set(PetOwner.toMap(petOwner)).whenComplete(() {
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => PetOwnerDashboard(
                  generalAppUser: generalAppUser, petOwner: petOwner)));
        });
      }
    });
  }

  ///Vet Profile Creation
  vetProfileCreation(
      {required context, required GeneralAppUser generalAppUser}) async {
    CustomProgressIndicatorDialog(context: context);
    var vetRef = FirebaseHelper.VET_REF;
    vetRef.get().then((value) {
      print(value.hasChild(generalAppUser.uid));
      if (value.hasChild(generalAppUser.uid)) {
        value.child(generalAppUser.uid).children.forEach((element) {
          ServiceProvider serviceProviders =
              ServiceProvider.fromJson(element.value);
          Navigator.pop(context);
          goToServiceProviderDashboard(
              context: context,
              serviceProvider: serviceProviders,
              generalAppUser: generalAppUser);

          print("Service Provider Login Success ${serviceProviders.id}");
        });
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titleTextStyle: TextStyle(
                    fontSize: 22, color: MyColors.MATERIAL_LIGHT_GREEN),
                actionsAlignment: MainAxisAlignment.spaceAround,
                title: Text("Veterinarian"),
                content: Text(
                    "Dear ${generalAppUser.userName}..!\nYou are not registered as Veterinarian.\nDo You Want To Register?"),
                actions: [
                  MyButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: "No",
                      color: Colors.white,
                      textColor: MyColors.MATERIAL_LIGHT_GREEN,
                      borderRadius: 0),
                  MyButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                ServiceProviderRegistrationPage(
                                  generalAppUser: generalAppUser,
                                  userType: ServiceProvider.VET,
                                )));
                      },
                      title: "Yes",
                      color: MyColors.MATERIAL_LIGHT_GREEN,
                      textColor: Colors.white,
                      borderRadius: 0),
                ],
              );
            });
      }
    });
  }

  /// Breeder profile Creation
  breederProfileCreation(
      {required context, required GeneralAppUser generalAppUser}) async {
    CustomProgressIndicatorDialog(context: context);
    var vetRef = FirebaseHelper.BREEDER_REF;
    vetRef.get().then((value) {
      print(value.hasChild(generalAppUser.uid));
      if (value.hasChild(generalAppUser.uid)) {
        value.child(generalAppUser.uid).children.forEach((element) {
          ServiceProvider serviceProviders =
              ServiceProvider.fromJson(element.value);
          Navigator.pop(context);
          goToServiceProviderDashboard(
              context: context,
              serviceProvider: serviceProviders,
              generalAppUser: generalAppUser);
          print("Service Provider Login Success ${serviceProviders.id}");
        });
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titleTextStyle: TextStyle(
                    fontSize: 22, color: MyColors.MATERIAL_LIGHT_GREEN),
                actionsAlignment: MainAxisAlignment.spaceAround,
                title: Text("Breeder"),
                content: Text(
                    "Dear ${generalAppUser.userName}..!\nYou are not registered as Breeder.\nDo You Want To Register?"),
                actions: [
                  MyButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: "No",
                      color: Colors.white,
                      textColor: MyColors.MATERIAL_LIGHT_GREEN,
                      borderRadius: 0),
                  MyButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                ServiceProviderRegistrationPage(
                                  generalAppUser: generalAppUser,
                                  userType: ServiceProvider.BREEDER,
                                )));
                      },
                      title: "Yes",
                      color: MyColors.MATERIAL_LIGHT_GREEN,
                      textColor: Colors.white,
                      borderRadius: 0),
                ],
              );
            });
      }
    });
  }

  /// Trainer Profile Creation
  trainerProfileCreation(
      {required context, required GeneralAppUser generalAppUser}) async {
    CustomProgressIndicatorDialog(context: context);
    var vetRef = FirebaseHelper.TRAINER_REF;
    vetRef.get().then((value) {
      print(value.hasChild(generalAppUser.uid));
      if (value.hasChild(generalAppUser.uid)) {
        value.child(generalAppUser.uid).children.forEach((element) {
          ServiceProvider serviceProviders =
              ServiceProvider.fromJson(element.value);
          Navigator.pop(context);
          goToServiceProviderDashboard(
              context: context,
              serviceProvider: serviceProviders,
              generalAppUser: generalAppUser);
          print("Service Provider Login Success ${serviceProviders.id}");
        });
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titleTextStyle: TextStyle(
                    fontSize: 22, color: MyColors.MATERIAL_LIGHT_GREEN),
                actionsAlignment: MainAxisAlignment.spaceAround,
                title: Text("Trainer"),
                content: Text(
                    "Dear ${generalAppUser.userName}..!\nYou are not registered as Trainer.\nDo You Want To Register?"),
                actions: [
                  MyButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: "No",
                      color: Colors.white,
                      textColor: MyColors.MATERIAL_LIGHT_GREEN,
                      borderRadius: 0),
                  MyButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                ServiceProviderRegistrationPage(
                                  generalAppUser: generalAppUser,
                                  userType: ServiceProvider.TRAINER,
                                )));
                      },
                      title: "Yes",
                      color: MyColors.MATERIAL_LIGHT_GREEN,
                      textColor: Colors.white,
                      borderRadius: 0),
                ],
              );
            });
      }
    });
  }

  //navigate to providerDashboard
  goToServiceProviderDashboard(
      {required context,
      required ServiceProvider serviceProvider,
      required GeneralAppUser generalAppUser}) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ServiceProviderDashboard(
              generalAppUser: generalAppUser,
              serviceProvider: serviceProvider,
              pages: [
                HomePageServiceProvide(
                  serviceProvider: serviceProvider,
                ),
                NotificationPageServiceProvider(),
                ProfilePageServiceProvider()
              ],
            )));
  }
}
