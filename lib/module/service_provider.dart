import 'dart:core';

import 'package:location/location.dart';
enum ServiceProviderType{
  Trainer,
  Veterinarian,
  Breeder
}
///--------------------------------------------------------------------------///
///Service Provider Class
class ServiceProvider {

  //Static Member
  late final ServiceProviderType _serviceProviderType;
  late final String _id;
  late final String _name;
  late final String? _experience;
  late final String _qualification;
  late final double _fee;
  late final double? _numberOfStars;
  late final List<String> _supportedSpecies;
  late final String _description;
  late final ScheduleOfServiceProvider _scheduleOfServiceProvider;
  late final LocationData _locationData;

  /// Constructor for ServiceProvider Class
  ServiceProvider(
      {required ServiceProviderType serviceProviderType,
        required String id,
      required String name,
      required String qualification,
      required double fee,
      String? experience,
      double? numberOfStars,
      required List<String> supportedSpecies,
      required String description,
      required ScheduleOfServiceProvider scheduleOfServiceProvider,
      required LocationData locationData}) {
    _serviceProviderType = serviceProviderType;
    _id = id;
    _name = name;
     (experience != null)
        ? _experience = experience
        : _experience = "No Experience";
    _qualification = qualification;
    _fee = fee;
    (numberOfStars != null)
        ? _numberOfStars = numberOfStars
        : _numberOfStars = 0;
    _supportedSpecies = supportedSpecies;
    _description = description;
    _scheduleOfServiceProvider = scheduleOfServiceProvider;
    _locationData = locationData;
  }

  /// Getters
  ServiceProviderType get serviceProviderType => _serviceProviderType;
  String get id => _id;

  String get name => _name;

  String get qualification => _qualification;

  double get fee => _fee;

  String? get experience => _experience;

  double? get numberOfStars => _numberOfStars;

  List<String> get supportedSpecies => _supportedSpecies;

  String get description => _description;
  ScheduleOfServiceProvider get scheduleOfServiceProvider => _scheduleOfServiceProvider;
  LocationData get locationData => _locationData;

  ///Setters
  set experience(String? experience) => (experience != null)
      ? _experience = experience
      : _experience = "No Experience";

  set numberOfStars(double? numberOfStars) => (numberOfStars != null)
      ? _numberOfStars = numberOfStars
      : _numberOfStars = 0;
}
///-----------------------------------------------------------------------//////
/// Service Provider Schedule Class
class ScheduleOfServiceProvider {
  late final DateTime? _dateTime;
  late final bool _sameScheduleForAllWeek;
  late final List<String> _workingDaysOfWeek;

  ScheduleOfServiceProvider(
      {required List<String> workingDaysOfWeek,
      DateTime? dateTime,
      bool sameScheduleForAllWeek = true}) {
    _dateTime = dateTime;
    _sameScheduleForAllWeek = sameScheduleForAllWeek;
    _workingDaysOfWeek = workingDaysOfWeek;
  }

  ///Getters
  DateTime? get dateTime => _dateTime;

  bool get sameScheduleForAllWeeks => _sameScheduleForAllWeek;

  List<String> get workingDaysOfWeek => _workingDaysOfWeek;
}
