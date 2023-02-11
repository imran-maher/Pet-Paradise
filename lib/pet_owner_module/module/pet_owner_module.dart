class PetOwner{
  late final String _petOwnerId;
  late final String _profileImgUrl;

  PetOwner({required String petOwnerId , required String profileImgUrl}){
    this._petOwnerId = petOwnerId;
    this._profileImgUrl = profileImgUrl;

  }

  factory PetOwner.fromJson(var json){
    return PetOwner(petOwnerId: json['petOwnerId'], profileImgUrl: json['profileImgUrl']);
  }

  static Map<String,dynamic> toMap(PetOwner petOwner){
    return{
      'petOwnerId' : petOwner._petOwnerId,
      'profileImgUrl' : petOwner._profileImgUrl
    };
  }

  String get profileImgUrl => _profileImgUrl;

  set profileImgUrl(String value) {
    _profileImgUrl = value;
  }

  String get petOwnerId => _petOwnerId;

  set petOwnerId(String value) {
    _petOwnerId = value;
  }
}