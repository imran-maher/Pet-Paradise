
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';

class FirebaseHelper{
   static final  databaseReference =  FirebaseDatabase.instanceFor(app: Firebase.app(),databaseURL: 'https://pet-paradise-61cf7-default-rtdb.asia-southeast1.firebasedatabase.app/');
   static final  SELLER_DATABASE_REF = databaseReference.ref("sellers-dat") ;
   static final PET_OWNER_DATABASE_REF = databaseReference.ref("pet-owners-data");
   static final SERVICE_PROVIDERS_DATABASE_REF = databaseReference.ref("service-providers-data");

   static AppUser fetchAppUserBasicInfo(String uid){
      var appUser;
      FirebaseHelper.PET_OWNER_DATABASE_REF.ref.onValue.listen((event) {
         appUser =
         AppUser.fromJason(event.snapshot.child(uid).value);
         });
      return appUser as AppUser;
      }
}