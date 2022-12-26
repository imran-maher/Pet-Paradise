class SellerBasicInfo {
  late final String? _emailAddress;
  late final String _phoneNumber;
  late final String? _storeName;

  SellerBasicInfo.init(
      { String? emailAddress,
      required String phoneNumber,
       String? storeName}) {
    this._emailAddress = emailAddress;
    this._phoneNumber = phoneNumber;
    this._storeName = storeName;
  }

  String? get storeName => _storeName;

  set storeName(String? value) {
    _storeName = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String? get emailAddress => _emailAddress;

  set emailAddress(String? value) {
    _emailAddress = value;
  }
}
