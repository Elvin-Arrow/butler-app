import 'package:butler_app/src/models/saved_item.dart';
import 'package:butler_app/src/resources/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService{
  final _firestore = FirebaseFirestore.instance;
  Auth _auth = Auth();
  User _user;

  Future<String> getCurrentUserEmail() async {
    _user = await _auth.getCurrentUser();
    return _user.email;
  }

  Future<void> postItemOnFirestore(SavedItem item) async{
    await _auth.checkInternConnection();
    final _email = await getCurrentUserEmail();

    DocumentReference _ref =
    _firestore.collection('saved').doc();

    try{
      await _ref.set({
        'email': _email,
        'title': item.name,
        'by': item.by,
        'type': item.type,
        'lang': item.language,
        'timestamp': DateTime.now().millisecondsSinceEpoch
      });
    }
    catch (err) {
      throw Exception(err);
    }
  }

  Future<List<QueryDocumentSnapshot>> getUsersSavedItems() async {
    await _auth.checkInternConnection();
    final _email = await getCurrentUserEmail();

    QuerySnapshot querySnapshot = await _firestore
        .collection('saved')
        .where('email', isEqualTo: _email)
        .orderBy('timestamp', descending: true)
        .get();

    return querySnapshot.docs;
  }
}