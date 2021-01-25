import 'package:butler_app/src/models/auth_credentials.dart';
import 'package:butler_app/src/resources/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      if (currentUser != null) await _setAuthStatus(true);

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

    if (currentUser != null) await _setAuthStatus(true);

    return currentUser != null ? true : false;
  }

  Future<bool> checkAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final flag = prefs.getBool('authenticated');

    return flag ?? false;
  }

  Future<void> _setAuthStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      await prefs.setBool('authenticated', status);
    } catch (_) {}
  }
}
