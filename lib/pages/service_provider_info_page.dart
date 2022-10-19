import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/module/service_provider.dart';

class ServiceProviderInfoPage extends StatefulWidget {
  ServiceProviderInfoPage({Key? key}) : super(key: key) {}

  @override
  State<ServiceProviderInfoPage> createState() =>
      _ServiceProviderInfoPageState();
}

class _ServiceProviderInfoPageState extends State<ServiceProviderInfoPage> {
  ServiceProvider serviceProvider = ServiceProvider(
      serviceProviderType: ServiceProviderType.Veterinarian,
      id: "124",
      name: "Dr Ejaz Ahmad ",
      qualification: "This is Qualification",
      fee: 500,
      supportedSpecies: ["Cat", "Dog"],
      description: "This is Description",
      scheduleOfServiceProvider: ScheduleOfServiceProvider(
          workingDaysOfWeek: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
          sameScheduleForAllWeek: true),
      locationData: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:20 ,
      ),
      body: Responsive(
        mobile: mobile(context, serviceProvider),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }

  ///Mobile App UI
  Widget mobile(BuildContext context, ServiceProvider serviceProvider) {
    return Stack(children: [
      Image(image: AssetImage("assets/images/logo.png"),alignment: Alignment.topCenter,),

    ],);
  }

  ///Tablet App UI
  Widget tablet(BuildContext context) {
    return Center(
      child: Text("Designing Process"),
    );
  }

  ///Tablet App UI
  Widget web(BuildContext context) {
    return Center(
      child: Text("Designing Process"),
    );
  }
}
