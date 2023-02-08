class AppUser {
  static const String PET_OWNER = 'pet-owner';
  static const String SERVICE_PROVIDER = 'service-provider';
  static const String SELLER = 'seller';

  late final String _uid;
  late final String _userType;
  late final String? _userName;
  late final String _userEmail;

  AppUser(
      {required String userType,
      required String uid,
      required String userName,
      required String userEmail}){
    this._userType = userType;
    this._userEmail = userEmail;
    this._userName = userName;
    this._uid = uid;
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this._uid,
      'userType': this._userType,
      'userName': this._userName,
      'userEmail': this._userEmail
    };
  }

  factory AppUser.fromJason(var json) {
    print(json.toString());
    return AppUser(
        uid: json['uid'],
        userType: json['userType'],
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

  String get userType => _userType;

  set userType(String value) {
    _userType = value;
  }

  String get uuid => _uid;

  set uuid(String value) {
    _uid = value;
  }
}
