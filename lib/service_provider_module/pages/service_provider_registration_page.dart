import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/custom_widgets/dailogs.dart';
import 'package:pet_paradise/firebase_services/firebase_helper.dart';
import 'package:pet_paradise/service_provider_module/module/service_providers.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';

import '../../utils/colors.dart';

class ServiceProviderRegistrationPage extends StatefulWidget {
  late final GeneralAppUser _generalAppUser;
  late final String _userType;
  late final String _serviceProviderId;
  late final _databaseRef;

  ServiceProviderRegistrationPage(
      {Key? key,
      required GeneralAppUser generalAppUser,
      required String userType})
      : super(key: key) {
    this._userType = userType;
    this._generalAppUser = generalAppUser;
  }

  @override
  State<ServiceProviderRegistrationPage> createState() =>
      _ServiceProviderRegistrationPageState();
}

class _ServiceProviderRegistrationPageState
    extends State<ServiceProviderRegistrationPage> {
  DateTime? dob = null;
  TimeOfDay? from = null;
  TimeOfDay? to = null;
  bool monChip = false;
  bool tueChip = false;
  bool wedChip = false;
  bool thuChip = false;
  bool friChip = false;
  bool satChip = false;
  bool sunChip = false;
  List<String> activeDays = List.empty(growable: true);

  ///Text Editing Controllers
  TextEditingController nameController = TextEditingController();
  late TextEditingController emailController;

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cnicController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget._userType == ServiceProvider.BREEDER) {
      widget._databaseRef =
          FirebaseHelper.BREEDER_REF.child(widget._generalAppUser.uid);
      widget._serviceProviderId = widget._databaseRef.push().key!;
    } else if (widget._userType == ServiceProvider.VET) {
      widget._databaseRef =
          FirebaseHelper.VET_REF.child(widget._generalAppUser.uid);
      widget._serviceProviderId = widget._databaseRef.push().key!;
    } else {
      widget._databaseRef =
          FirebaseHelper.TRAINER_REF.child(widget._generalAppUser.uid);
      widget._serviceProviderId = widget._databaseRef.push().key!;
    }

    emailController =
        TextEditingController(text: widget._generalAppUser.userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile:
            mobile(context: context, generalAppUser: widget._generalAppUser),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///Mobile UI
  Widget mobile({required context, required GeneralAppUser generalAppUser}) {
    return Stack(
      children: [
        backgroundWidget(),
        SingleChildScrollView(
          child: leftAndRightPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 180,
                    width: 180,
                  ),
                ),
                Text(
                  "Welcome\nTo Pet Paradise~",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "A dream-filled Paradise ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Verify Yourself",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                ///Personal Info
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Personal Info",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Card(
                  shadowColor: MyColors.MATERIAL_LIGHT_GREEN,
                  elevation: 5,
                  child: leftAndRightPadding(
                    child: Container(
                      height: 680,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 15,
                          ),

                          ///User name
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "Full Name",
                                label: Text("Enter Full Name"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          ///Email
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: emailController,
                            enabled: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "Email Address",
                                label: Text("Enter Email"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          ///CNIC Number
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: cnicController,
                            keyboardType: TextInputType.numberWithOptions(),
                            maxLength: 13,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "Email CNIC",
                                label: Text("Enter CNIC"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          ///Phone Number
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: mobileNumberController,
                            keyboardType: TextInputType.phone,
                            maxLength: 13,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "Mobile Number",
                                helperText: "+923011234567",
                                label: Text("Enter Mobile Number"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          ///Date of Birth
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(dob != null
                                          ? dob.toString().substring(0, 10)
                                          : "Date of Birth")),
                                  IconButton(
                                      onPressed: () async {
                                        showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1960),
                                                lastDate: DateTime.now(),
                                                initialDate: DateTime.now())
                                            .then((value) {
                                          setState(() {
                                            if (value != null) {
                                              dob = DateTime(value.year,
                                                  value.month, value.day);
                                              print(dob
                                                  .toString()
                                                  .substring(0, 10));
                                            }
                                          });
                                        });
                                      },
                                      icon: Icon(Icons.date_range))
                                ],
                              ),
                            ),
                          ),

                          ///Qualification
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: qualificationController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "What is Your Qualification ",
                                label: Text("Qualification"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          ///Experience
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: experienceController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "What is Your Experience ",
                                label: Text("Experience"),
                                helperText: "5 years etc",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          ///Fee
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: feeController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "What is your fee? ",
                                label: Text("Fee"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Address
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Address",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Card(
                  shadowColor: MyColors.MATERIAL_LIGHT_GREEN,
                  elevation: 5,
                  child: leftAndRightPadding(
                    child: Container(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 15,
                          ),

                          ///Country
                          TextFormField(
                            controller: countryNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "Country Name",
                                label: Text("Enter Country Name"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          ///City
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: cityNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "City",
                                label: Text("Enter City"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          ///Street Address
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: streetAddressController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "Street Address",
                                label: Text("Enter Street Address"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Time Schedule
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Time Schedule",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Card(
                  shadowColor: MyColors.MATERIAL_LIGHT_GREEN,
                  elevation: 5,
                  child: leftAndRightPadding(
                    child: Container(
                      height: 340,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Active Days",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),

                          ///Mon to Wed
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ///Monday Chip
                              Chip(
                                label: Text("Mon"),
                                backgroundColor: monChip
                                    ? MyColors.MATERIAL_LIGHT_GREEN
                                    : Colors.grey,
                                onDeleted: () {
                                  setState(() {
                                    if (monChip == true) {
                                      monChip = false;
                                      activeDays.remove("Monday");
                                    } else {
                                      monChip = true;
                                      activeDays.add("Monday");
                                    }
                                  });
                                },
                              ),

                              ///Tuesday Chip
                              Chip(
                                label: Text("Tue"),
                                backgroundColor: tueChip
                                    ? MyColors.MATERIAL_LIGHT_GREEN
                                    : Colors.grey,
                                onDeleted: () {
                                  setState(() {
                                    if (tueChip == true) {
                                      tueChip = false;
                                      activeDays.remove("Tuesday");
                                    } else {
                                      tueChip = true;
                                      activeDays.add("Tuesday");
                                    }
                                  });
                                },
                              ),

                              ///Wednesday Chip
                              Chip(
                                label: Text("Wed"),
                                backgroundColor: wedChip
                                    ? MyColors.MATERIAL_LIGHT_GREEN
                                    : Colors.grey,
                                onDeleted: () {
                                  setState(() {
                                    if (wedChip == true) {
                                      wedChip = false;
                                      activeDays.remove("Wednesday");
                                    } else {
                                      wedChip = true;
                                      activeDays.add("Wednesday");
                                    }
                                  });
                                },
                              )
                            ],
                          ),

                          ///Thu to Sat
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ///Thursday Chip
                              Chip(
                                label: Text("Thu"),
                                backgroundColor: thuChip
                                    ? MyColors.MATERIAL_LIGHT_GREEN
                                    : Colors.grey,
                                onDeleted: () {
                                  setState(() {
                                    if (thuChip == true) {
                                      thuChip = false;
                                      activeDays.remove("Thursday");
                                    } else {
                                      thuChip = true;
                                      activeDays.add("Thursday");
                                    }
                                  });
                                },
                              ),

                              ///Friday Chip
                              Chip(
                                label: Text("Fri"),
                                backgroundColor: friChip
                                    ? MyColors.MATERIAL_LIGHT_GREEN
                                    : Colors.grey,
                                onDeleted: () {
                                  setState(() {
                                    if (friChip == true) {
                                      friChip = false;
                                      activeDays.remove("Friday");
                                    } else {
                                      friChip = true;
                                      activeDays.add("Friday");
                                    }
                                  });
                                },
                              ),

                              ///Saturday Chip
                              Chip(
                                label: Text("Sat"),
                                backgroundColor: satChip
                                    ? MyColors.MATERIAL_LIGHT_GREEN
                                    : Colors.grey,
                                onDeleted: () {
                                  setState(() {
                                    if (satChip == true) {
                                      satChip = false;
                                      activeDays.remove("Saturday");
                                    } else {
                                      satChip = true;
                                      activeDays.add("Saturday");
                                    }
                                  });
                                },
                              )
                            ],
                          ),

                          ///Sunday
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ///Sunday Chip
                              Chip(
                                label: Text("Sun"),
                                backgroundColor: sunChip
                                    ? MyColors.MATERIAL_LIGHT_GREEN
                                    : Colors.grey,
                                onDeleted: () {
                                  setState(() {
                                    if (sunChip == true) {
                                      sunChip = false;
                                      activeDays.remove("Sunday");
                                    } else {
                                      sunChip = true;
                                      activeDays.add("Sunday");
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Time",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              /// Time From
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  height: 55,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(from != null
                                            ? "${from?.hour} : ${from?.minute} "
                                            : "From"),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            setState(() {
                                              from = value;
                                            });
                                          });
                                        },
                                        icon: Icon(
                                          Icons.access_time_outlined,
                                          color: MyColors.MATERIAL_LIGHT_GREEN,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              /// Time To
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  height: 55,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(to != null
                                            ? "${to?.hour} : ${to?.minute} "
                                            : "To"),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            setState(() {
                                              to = value;
                                            });
                                          });
                                        },
                                        icon: Icon(
                                          Icons.access_time_outlined,
                                          color: MyColors.MATERIAL_LIGHT_GREEN,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                    onPressed: () {
                      if (nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          cnicController.text.isEmpty ||
                          mobileNumberController.text.isEmpty ||
                          dob == null ||
                          qualificationController.text.isEmpty ||
                          experienceController.text.isEmpty ||
                          feeController.text.isEmpty ||
                          countryNameController.text.isEmpty ||
                          cityNameController.text.isEmpty ||
                          streetAddressController.text.isEmpty ||
                          activeDays.isEmpty ||
                          from == null ||
                          to == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Some Fields are Empty",style: TextStyle(color: Colors.red),),
                          backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
                        ));
                      } else {
                        ServiceProvider serviceProvider = ServiceProvider(
                            id: widget._serviceProviderId,
                            name: nameController.text,
                            serviceType: widget._userType,
                            qualification: qualificationController.text,
                            experience: experienceController.text,
                            streetAddress: streetAddressController.text,
                            rating: 0,
                            fee: double.parse(feeController.text),
                            activeDays: activeDays,
                            startTime: from!,
                            endTime: to!,
                            cnic: cnicController.text,
                            phoneNumber: mobileNumberController.text,
                            imgUrl: "No Image",
                            dob: dob!,
                            countryName: countryNameController.text,
                            cityName: cityNameController.text);
                        registerServiceProvide(
                            context: context,
                            userType: widget._userType,
                            generalAppUser: generalAppUser,
                            serviceProvider: serviceProvider);
                      }
                    },
                    title: "Register",
                    color: MyColors.MATERIAL_LIGHT_GREEN,
                    textColor: Colors.white),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  registerServiceProvide(
      {required context,
      required String userType,
      required GeneralAppUser generalAppUser,
      required ServiceProvider serviceProvider}) async {
    CustomProgressIndicatorDialog(context: context);
    try {
      DatabaseReference ref;
      if (userType == ServiceProvider.VET) {
        ref = FirebaseHelper.VET_REF
            .child(widget._generalAppUser.uid)
            .child(widget._serviceProviderId);
      } else if (userType == ServiceProvider.BREEDER) {
        ref = FirebaseHelper.BREEDER_REF
            .child(widget._generalAppUser.uid)
            .child(widget._serviceProviderId);
      } else {
        ref = FirebaseHelper.TRAINER_REF
            .child(widget._generalAppUser.uid)
            .child(widget._serviceProviderId);
      }

      ref.set(ServiceProvider.toMap(serviceProvider)).whenComplete(() {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Registration Successfully",style: TextStyle(color: Colors.white),),
          backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
        ));
      });
    } on FirebaseException catch (e) {
      print(e.code);
    } catch (e) {
      print(e.toString());
    }
  }
}
