class GeneralAppUser {
  static const String PET_OWNER = 'pet-owner';
  static const String SERVICE_PROVIDER = 'service-provider';
  static const String SELLER = 'seller';

  late final String _uid;
  late final String? _userName;
  late final String _userEmail;
  GeneralAppUser(
      {
      required String uid,
      required String userName,
      required String userEmail,}){

    this._userEmail = userEmail;
    this._userName = userName;
    this._uid = uid;

  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this._uid,

      'userName': this._userName,
      'userEmail': this._userEmail,


    };
  }

  factory GeneralAppUser.fromJason(var json) {
    print(json.toString());
    return GeneralAppUser(

        uid: json['uid'],

        userName: json['userName'],
        userEmail: json['userEmail']);
  }

  String get userEmail => _userEmail;

  set userEmail(String value) {
    _userEmail = value;
  }

  String? get userName => _userName;

  set userName(String? value) {
    _userName = value;
  }



  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }





}
