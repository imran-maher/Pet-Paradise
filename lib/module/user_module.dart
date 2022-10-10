class UserModule{

  String? _id;
  late final String _name;
  late final String _email;

  UserModule({required String name , required String email , String? id }){
    this._id = id;
    this._email = email;
    this._name = name;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }
}