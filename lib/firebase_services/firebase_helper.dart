
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseHelper{
   static final  databaseReference =  FirebaseDatabase.instanceFor(app: Firebase.app(),databaseURL: 'https://pet-paradise-61cf7-default-rtdb.asia-southeast1.firebasedatabase.app/');
   static final  SELLER_DATABASE_REF = databaseReference.ref("sellers-dat") ;
   static final PET_OWNER_DATABASE_REF = databaseReference.ref("pet-owners-data");
   static final TRAINER_REF = databaseReference.ref("Trainer-data");
   static final VET_REF = databaseReference.ref("Veterinarian-data");
   static final BREEDER_REF = databaseReference.ref("BREEDER-data");

   static final BLOGS_REF = databaseReference.ref("blogs");
   static final APP_USERS_REF = databaseReference.ref("App-Users");

}