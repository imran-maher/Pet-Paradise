
class UserCredentials{
  late final String _email;
  late final String _password;
  late final String? _name;
  late final String? _phoneNumber;

  UserCredentials({required String email , required String password , String? name , String? phoneNumber }){
    this._email = email;
    this._password = password;
    this._name = name;
    this._phoneNumber = phoneNumber;
  }

  String? get phoneNumber => _phoneNumber;

  set phoneNumber(String? value) {
    _phoneNumber = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}
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