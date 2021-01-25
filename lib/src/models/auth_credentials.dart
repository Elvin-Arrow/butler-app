/// Model class for housing the user authentication credentials
///
class AuthCredentials {
  String _email;
  String _password;

  String get email => _email;
  String get password => _password;

  void updateEmail(String email) => _email = email;
  void updatePassword(String password) => _password = password;
}
