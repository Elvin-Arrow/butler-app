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

  Future<bool> login(AuthCredentials authCredentials) async {
    try {
      await _auth.loginUserWithEmailAndPassword(
        email: authCredentials.email,
        password: authCredentials.password,
      );

      final currentUser = await _auth.getCurrentUser();

      return currentUser != null ? true : false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> register(AuthCredentials authCredentials) async {
    await _auth.registerUser(
      email: authCredentials.email,
      password: authCredentials.password,
    );

    final currentUser = await _auth.getCurrentUser();

    return currentUser != null ? true : false;
  }
}
