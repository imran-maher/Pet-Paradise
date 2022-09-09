import 'package:flutter/material.dart';
import 'package:pet_paradise/screens/splash_screen.dart';
import 'package:pet_paradise/utils/strings.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyPetParadiseApp());
}

class MyPetParadiseApp extends StatelessWidget {
  const MyPetParadiseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyStrings.APP_TITTLE,
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
    );
  }
}
