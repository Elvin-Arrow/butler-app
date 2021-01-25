import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future<User> getCurrentUser() async => _auth.currentUser;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> loginUserWithEmailAndPassword(
      {String email, String password}) async {
    // await checkInternConnection();
    // Use the email and password to sign-in the user
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      throw 'Invalid username or password';
    }
  }

  Future<void> registerUser({String email, String password}) async {
    // await checkInternConnection();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      throw 'User already exists';
    }
  }

  Future<void> checkInternConnection() async {
    final ConnectivityResult connectivityStatus =
        await (Connectivity().checkConnectivity());

    if (connectivityStatus == ConnectivityResult.none)
      throw 'No internet connection';
  }
}
