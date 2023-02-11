import 'package:shared_preferences/shared_preferences.dart';

void saveLoginCredentials({required email,required password,required String userType})async{

  SharedPreferences preferences =await  SharedPreferences.getInstance();
  preferences.setString("email", email);
  preferences.setString("password", password);
  preferences.setString("userType", userType);

}