import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/strings.dart';

main() {
  runApp(MyPetParadiseApp());
}

class MyPetParadiseApp extends StatelessWidget {
  const MyPetParadiseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyStrings.APP_TITTLE,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: (){},
            color: MyColors.green,
            child: Text("Hello"),
          ),
        ),
      ),
    );
  }
}
