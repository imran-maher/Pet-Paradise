

class ServiceProvider {
  static const TRAINER = "Trainer";
  static const VET = "Veterinarian";
  static const BREEDER = "Breeder";

  late final String _id;
  late final String _name;
  late final String _serviceType;
  late final String _qualification;
  late final String _experience;
  late final int _rating;
  late final num _fee;
  late final List _activeDays;
  late final String _startTime;
  late final String _endTime;
  late final String _cnic;
  late final String _phoneNumber;
  late final String _imgUrl;
  late final String _dob;
  late final String _countryName;
  late final String _cityName;
  late final String _streetAddress;

  ///Constructors
  ServiceProvider(
      {required String id,
      required String name,
      required String serviceType,
      required String qualification,
      required String experience,
      required String streetAddress,
      required int rating,
      required num fee,
      required List activeDays,
      required String startTime,
      required String endTime,
      required String cnic,
      required String phoneNumber,
      required String imgUrl,
      required String dob,
      required String countryName,
      required String cityName}) {
    this._countryName = countryName;
    this._cityName = cityName;
    this._id = id;
    this._name = name;
    this._serviceType = serviceType;
    this._qualification = qualification;
    this._experience = experience;
    this._streetAddress = streetAddress;
    this._rating = rating;
    this._fee = fee;
    this._activeDays = activeDays;
    this._startTime = startTime;
    this._endTime = endTime;
    this._cnic = cnic;
    this._phoneNumber = phoneNumber;
    this._imgUrl = imgUrl;
    this._dob = dob;
  }

  ///Constructor
  factory ServiceProvider.fromJson(var json) {
    return ServiceProvider(
        countryName: json['countryName'] as String,
        cityName: json['cityName'] as String,
        id: json['id'] as String,
        name: json['name'] as String,
        serviceType: json['serviceType'] as String,
        qualification: json['qualification'] as String,
        experience: json['experience'] as String,
        streetAddress: json['streetAddress'] as String,
        rating: json['rating'] as int,
        fee: json['fee'] as num,
        activeDays: json['activeDays'] as List,
        startTime: json['startTime'] as String,
        endTime: json['endTime'] as String,
        cnic: json['cnic'] as String,
        phoneNumber: json['phoneNumber'] as String,
        imgUrl: json['imgUrl'] as String,
        dob: json['dob'] as String) ;
  }

  static Map<String, dynamic> toMap(ServiceProvider serviceProvider) {
    return {
      'countryName' : serviceProvider.countryName,
      'cityName' : serviceProvider.cityName,
      'dob' : serviceProvider.dob,
      'imgUrl': serviceProvider.imgUrl,
      'phoneNumber': serviceProvider.phoneNumber,
      'cnic': serviceProvider.cnic,
      'endTime': serviceProvider.endTime,
      'startTime': serviceProvider.startTime,
      'activeDays': serviceProvider.activeDays,
      'fee': serviceProvider.fee,
      'rating': serviceProvider.rating,
      'streetAddress': serviceProvider.streetAddress,
      'experience': serviceProvider.experience,
      'qualification': serviceProvider.qualification,
      'serviceType': serviceProvider.serviceType,
      'name': serviceProvider.name,
      'id': serviceProvider.id
    };
  }

  String get streetAddress => _streetAddress;

  set streetAddress(String value) {
    _streetAddress = value;
  }

  String get cityName => _cityName;

  set cityName(String value) {
    _cityName = value;
  }

  String get countryName => _countryName;

  set countryName(String value) {
    _countryName = value;
  }

  String get dob => _dob;

  set dob(String value) {
    _dob = value;
  }

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get cnic => _cnic;

  set cnic(String value) {
    _cnic = value;
  }

  String get endTime => _endTime;

  set endTime(String value) {
    _endTime = value;
  }

  String get startTime => _startTime;

  set startTime(String value) {
    _startTime = value;
  }

  List get activeDays => _activeDays;

  set activeDays(List value) {
    _activeDays = value;
  }

  num get fee => _fee;

  set fee(num value) {
    _fee = value;
  }

  int get rating => _rating;

  set rating(int value) {
    _rating = value;
  }

  String get experience => _experience;

  set experience(String value) {
    _experience = value;
  }

  String get qualification => _qualification;

  set qualification(String value) {
    _qualification = value;
  }

  String get serviceType => _serviceType;

  set serviceType(String value) {
    _serviceType = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
