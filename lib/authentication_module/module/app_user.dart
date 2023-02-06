class AppUser {
  static const String PET_OWNER = 'pet-owner';
  static const String SERVICE_PROVIDER = 'service-provider';
  static const String SELLER = 'seller';

  late final String? _uuid;
  late final String _userType;
  late final String? _userName;
  late final String _userEmail;

  AppUser(this._uuid, this._userType, this._userName, this._userEmail);

  Map<String, dynamic> toMap() {
    return {
      'uuid': this._uuid,
      'userType': this._userType,
      'userName': this._userName,
      'userEmail': this._userEmail
    };
  }

  factory AppUser.fromJason(json){
    return AppUser(json['uuid'], json['userType'], json['userName'], json['userEmail']);
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

  String? get uuid => _uuid;

  set uuid(String? value) {
    _uuid = value;
  }
}
