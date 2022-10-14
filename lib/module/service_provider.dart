///Service Provider
class ServiceProvider {
  late final String _id;
  late final String _name;
  late final String? _experience;
  late final String _qualification;
  late final double _fee;
  late final double? _numberOfStars;
  late final List<String> _supportedSpecies;
  late final String _description;

  /// Constructor for ServiceProvider Class
  ServiceProvider({required String id,
    required String name,
    required String qualification,
    required double fee,
    String? experience ,
    double? numberOfStars ,
    required List<String> supportedSpecies,
    required String description}) {
    _id = id;
    _name = name;
    (experience != null) ? _experience = experience : _experience =
    "No Experience";
    _qualification = qualification;
    _fee = fee;
    (numberOfStars != null) ? _numberOfStars = numberOfStars : _numberOfStars =
    0;
    _supportedSpecies = supportedSpecies;
    _description = description;
  }

  /// Getters
  String get id => _id;

  String get name => _name;

  String get qualification => _qualification;

  double get fee => _fee;

  String? get experience => _experience;

  double? get numberOfStars => _numberOfStars;

  List<String> get supportedSpecies => _supportedSpecies;

  String get description => _description;

  ///Setters
  set experience(String? experience) =>
      (experience != null)
          ? _experience = experience
          : _experience = "No Experience";

  set numberOfStars(double? numberOfStars) =>
      (numberOfStars != null)
          ? _numberOfStars = numberOfStars
          : _numberOfStars = 0;

}

/// Service Provider Schedule
// class ScheduleOfServiceProvider {
//   late final DateTime? _dateTime;
//   late final bool? _sameScheduleForAllWeek;
//   late final List<String> _workingDaysOfWeek;
//
//
// }
