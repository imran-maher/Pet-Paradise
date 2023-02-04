import 'package:flutter/material.dart';
import 'package:pet_paradise/module/service_providers.dart';


class ServiceProviderDashboard extends StatefulWidget {
  late final List<ServiceProviders> _serviceProviders;
   ServiceProviderDashboard({Key? key,required List<ServiceProviders> serviceProviders}) : super(key: key){
     this._serviceProviders = serviceProviders;
   }

  @override
  State<ServiceProviderDashboard> createState() => _ServiceProviderDashboardState();
}

class _ServiceProviderDashboardState extends State<ServiceProviderDashboard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
