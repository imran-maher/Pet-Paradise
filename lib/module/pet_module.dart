class Pet {
  ///Data Members
  late final String _petId;
  late final _petImage;
  late final String _species;
  late final String _petName;
  late final String _petDescription;
  late final num _age;
  late final String _breed;
  late final String? _videoUrl;
  late final String? _warrantyType;
  late final num? _warrantyPeriod;
  late final String? _packageInformation;
  late final num _price;

  Pet({
    required String petId,
    required petImage,
    required species,
    required String petName,
    required String petDescription,
    required num age,
    required String breed,
    String? videoUrl,
    String? warrantyType,
    num? warrantyPeriod,
    String? packageInformation,
    required num petPrice
  }) {
    this._petId = petId;
    this._petImage = petImage;
    this._species = species;
    this._petName = petName;
    this._petDescription = petDescription;
    this._age = age;
    this._breed = breed;
    this._videoUrl = videoUrl;
    this._warrantyType = warrantyType;
    this._warrantyPeriod = warrantyPeriod;
    this._packageInformation = packageInformation;
    this._price = petPrice;

  }

  num get price => _price;

  set price(num value) {
    _price = value;
  }

  String? get packageInformation => _packageInformation;

  set packageInformation(String? value) {
    _packageInformation = value;
  }

  num? get warrantyPeriod => _warrantyPeriod;

  set warrantyPeriod(num? value) {
    _warrantyPeriod = value;
  }

  String? get warrantyType => _warrantyType;

  set warrantyType(String? value) {
    _warrantyType = value;
  }

  String? get videoUrl => _videoUrl;

  set videoUrl(String? value) {
    _videoUrl = value;
  }

  String get breed => _breed;

  set breed(String value) {
    _breed = value;
  }

  num get age => _age;

  set age(num value) {
    _age = value;
  }

  String get petDescription => _petDescription;

  set petDescription(String value) {
    _petDescription = value;
  }

  String get petName => _petName;

  set petName(String value) {
    _petName = value;
  }

  String get species => _species;

  set species(String value) {
    _species = value;
  }

  get petImage => _petImage;

  set petImage(value) {
    _petImage = value;
  }

  String get petId => _petId;

  set petId(String value) {
    _petId = value;
  }
}
