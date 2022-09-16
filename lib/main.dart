import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_paradise/screens/splash_screen.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/strings.dart';
import 'firebase_options.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyPetParadiseApp());
}

class MyPetParadiseApp extends StatelessWidget {
  const MyPetParadiseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyStrings.APP_TITTLE,
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: SplashScreen(),
    );
  }
}
