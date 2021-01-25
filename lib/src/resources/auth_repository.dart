import 'package:butler_app/src/models/auth_credentials.dart';
import 'package:butler_app/src/resources/services/auth_service.dart';

enum CredentialType {
  Email,
  Password,
}

enum AuthType {
  Login,
  Register,
}

class AuthRepository {
  Auth _auth;

  AuthRepository() {
    _auth = Auth();
  }

  void login(AuthCredentials loginModel) async {
    await _auth.loginUserWithEmailAndPassword(
      email: loginModel.email,
      password: loginModel.password,
    );
  }

  void register(AuthCredentials loginModel) async {
    await _auth.registerUser(
      email: loginModel.email,
      password: loginModel.password,
    );
  }
}
