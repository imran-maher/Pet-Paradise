import 'package:flutter/material.dart';

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
  late final double _fee;
  late final List<String> _activeDays;
  late final TimeOfDay _startTime;
  late final TimeOfDay _endTime;
  late final String _cnic;
  late final String _phoneNumber;
  late final String _imgUrl;
  late final DateTime _dob;
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
      required double fee,
      required List<String> activeDays,
      required TimeOfDay startTime,
      required TimeOfDay endTime,
      required String cnic,
      required String phoneNumber,
      required String imgUrl,
      required DateTime dob,
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
        countryName: json['countryName'],
        cityName: json['cityName'],
        id: json['id'],
        name: json['name'],
        serviceType: json['serviceType'],
        qualification: json['qualification'],
        experience: json['experience'],
        streetAddress: json['streetAddress'],
        rating: json['rating'],
        fee: json['fee'],
        activeDays: json['activeDays'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        cnic: json['cnic'],
        phoneNumber: json['phoneNumber'],
        imgUrl: json['imgUrl'],
        dob: json['dob'] as DateTime);
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

  DateTime get dob => _dob;

  set dob(DateTime value) {
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

  TimeOfDay get endTime => _endTime;

  set endTime(TimeOfDay value) {
    _endTime = value;
  }

  TimeOfDay get startTime => _startTime;

  set startTime(TimeOfDay value) {
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
