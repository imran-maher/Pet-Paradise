

class ServiceProviders {
  static const TRAINER = "Trainer";
  static const VET = "Veterinarian";
  static const BREEDER = "Breeder";


  late final String _id;
  late final String _name;
  late final String _serviceType;
  late final String _qualification;
  late final String _experience;
  late final String _address;
  late final int _rating;
  late final double _fee;
  late final List<String> _activeDays;
  late final DateTime _startTime;
  late final DateTime _endTime;
  late final String _imgUrl;

  ServiceProviders.init(
      {required String id,
      required String name,
      required String address,
      required double fee , required String serviceType}) {
    this._id = id;
    this._name = name;
    this._address = address;
    this._fee = fee;
    this._serviceType = serviceType;
  }

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  DateTime get endTime => _endTime;

  set endTime(DateTime value) {
    _endTime = value;
  }

  DateTime get startTime => _startTime;

  set startTime(DateTime value) {
    _startTime = value;
  }

  List<String> get activeDays => _activeDays;

  set activeDays(List<String> value) {
    _activeDays = value;
  }

  double get fee => _fee;

  set fee(double value) {
    _fee = value;
  }

  int get rating => _rating;

  set rating(int value) {
    _rating = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get experience => _experience;

  set experience(String value) {
    _experience = value;
  }

  String get qualification => _qualification;

  set qualification(String value) {
    _qualification = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get serviceType => _serviceType;

  set serviceType(String value) {
    _serviceType = value;
  }
}
