
import 'package:firebase_auth/firebase_auth.dart';


///Firebase Signup with Email and Password
Future<String> signUp(
    {required String email, required String password}) async {
  print("User Creating.........");
  String response = "";
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential =await auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    if(user != null){
      user.sendEmailVerification();
      response = "Account Created and Check Your Email To Verify ";
    }
  } on FirebaseAuthException catch (e) {
    response = e.code;
  } catch (e) {}
  return response;
}


///Firebase Login with Email and Password
Future<String> login({required String email , required String password})async{
  String response = "";
  try{
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    if(user != null){
      if(user.emailVerified){
        response = "Login Success , UUID : ${user.uid}";
      }else{
        response = "Your Email is Not Verified , Kindly Verify and Login Again";
      }
    }

  }on  FirebaseAuthException catch(e){
    response = e.code;
  }catch (e){
    response = e.toString();
  }
  return response;
}