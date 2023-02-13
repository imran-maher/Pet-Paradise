import 'package:flutter/material.dart';
import 'package:pet_paradise/service_provider_module/module/service_providers.dart';

class HomePageServiceProvide extends StatefulWidget {
  late final ServiceProvider _serviceProvider;
   HomePageServiceProvide({Key? key , required ServiceProvider serviceProvider}) : super(key: key){
    this._serviceProvider = serviceProvider;
  }

  @override
  State<HomePageServiceProvide> createState() => _HomePageServiceProvideState();
}

class _HomePageServiceProvideState extends State<HomePageServiceProvide> {
  @override
  Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: GestureDetector(
                      onTap: (){},
                      child: CircleAvatar(
                        maxRadius: 80,
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage(widget._serviceProvider.imgUrl),
                      ),
                    ))
              ]),
        )
      ],
    );
  }


}
