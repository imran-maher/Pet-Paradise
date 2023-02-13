class SellerBasicInfo {
  late final String? _emailAddress;
  late final String _phoneNumber;
  late final String? _storeName;
  late final bool _profileCompleted;

  SellerBasicInfo(
      {String? emailAddress,
      required String phoneNumber,
      String? storeName,
      bool profileCompleted = false}) {
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

///Seller Address Info
class SellerAddressModule {
  late final String? _businessAddress;
  late final String? _wareHouseAddress;
  late final String? _returnAddress;

  SellerAddressModule(
      {required String? businessAddress,
      required String? wareHouseAddress,
      required String? returnAddress}) {
    this._businessAddress = businessAddress;
    this._wareHouseAddress = wareHouseAddress;
    this._returnAddress = returnAddress;
  }

  String? get returnAddress => _returnAddress;

  set returnAddress(String? value) {
    _returnAddress = value;
  }

  String? get wareHouseAddress => _wareHouseAddress;

  set wareHouseAddress(String? value) {
    _wareHouseAddress = value;
  }

  String? get businessAddress => _businessAddress;

  set businessAddress(String? value) {
    _businessAddress = value;
  }
}

///Seller ID Info
class SellerIDInfoModule {
  late var _idFrontSide;
  late var _idBackSide;
  late final String _nameOnID;
  late final String _idNumber;

  SellerIDInfoModule.init(
      {required var idFrontSide,
      required var idBackSide,
      required String nameOnID,
      required String idNumber}) {
    this._idBackSide = idBackSide;
    this._idFrontSide = idFrontSide;
    this._nameOnID = nameOnID;
    this._idNumber = idNumber;
  }

  String get idNumber => _idNumber;

  set idNumber(String value) {
    _idNumber = value;
  }

  String get nameOnID => _nameOnID;

  set nameOnID(String value) {
    _nameOnID = value;
  }

  get idBackSide => _idBackSide;

  set idBackSide(value) {
    _idBackSide = value;
  }

  get idFrontSide => _idFrontSide;

  set idFrontSide(value) {
    _idFrontSide = value;
  }
}
