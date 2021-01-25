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

  Future<List<QuerySnapshot>> getUsersSavedItems() async {
    await _auth.checkInternConnection();
    final _email = await getCurrentUserEmail();

    List<QuerySnapshot> snapshots = List.empty(growable: true);

    QuerySnapshot querySnapshotMovies = await _firestore
        .collection('movies')
        .where('email', isEqualTo: _email)
        .orderBy('timestamp', descending: true)
        .get();
    snapshots.add(querySnapshotMovies);

    QuerySnapshot querySnapshotBooks = await _firestore
        .collection('books')
        .where('email', isEqualTo: _email)
        .orderBy('timestamp', descending: true)
        .get();
    snapshots.add(querySnapshotBooks);

    QuerySnapshot querySnapshotTvShows = await _firestore
        .collection('tv_shows')
        .where('email', isEqualTo: _email)
        .orderBy('timestamp', descending: true)
        .get();
    snapshots.add(querySnapshotTvShows);

    QuerySnapshot querySnapshotGames = await _firestore
        .collection('games')
        .where('email', isEqualTo: _email)
        .orderBy('timestamp', descending: true)
        .get();
    snapshots.add(querySnapshotGames);

    QuerySnapshot querySnapshotPodcasts = await _firestore
        .collection('podcasts')
        .where('email', isEqualTo: _email)
        .orderBy('timestamp', descending: true)
        .get();
    snapshots.add(querySnapshotPodcasts);

    return snapshots;
  }

  Future<void> postMovieonFirestore(SavedMovie savedMovie) async {
    await _auth.checkInternConnection();
    final _email = await getCurrentUserEmail();

    DocumentReference _ref =
    _firestore.collection('movies').doc();

    try{
      await _ref.set({
        'email': _email,
        'title': savedMovie.title,
        'lang': savedMovie.language,
        'popularity': savedMovie.popularity,
        'genre1': savedMovie.genre1,
        'genre2': savedMovie.genre2,
        'relDate': savedMovie.releaseDate,
        'timestamp': DateTime.now().millisecondsSinceEpoch
      });
    }
    catch (err) {
      throw Exception(err);
    }
  }

  Future<void> postBookonFirestore(SavedBook savedBook) async {
    await _auth.checkInternConnection();
    final _email = await getCurrentUserEmail();

    DocumentReference _ref =
    _firestore.collection('books').doc();

    try{
      await _ref.set({
        'email': _email,
        'title': savedBook.title,
        'lang': savedBook.language,
        'author': savedBook.author,
        'genre1': savedBook.genre1,
        'genre2': savedBook.genre2,
        'relDate': savedBook.releaseDate,
        'timestamp': DateTime.now().millisecondsSinceEpoch
      });
    }
    catch (err) {
      throw Exception(err);
    }
  }

  Future<void> postGameonFirestore(SavedGame savedGame) async {
    await _auth.checkInternConnection();
    final _email = await getCurrentUserEmail();

    DocumentReference _ref =
    _firestore.collection('games').doc();

    try{
      await _ref.set({
        'email': _email,
        'title': savedGame.title,
        'lang': savedGame.language,
        'genre1': savedGame.genre1,
        'genre2': savedGame.genre2,
        'relDate': savedGame.releaseDate,
        'timestamp': DateTime.now().millisecondsSinceEpoch
      });
    }
    catch (err) {
      throw Exception(err);
    }
  }

  Future<void> postTVShowOnFirestore(SavedTVShow savedTvShow) async {
    await _auth.checkInternConnection();
    final _email = await getCurrentUserEmail();

    DocumentReference _ref =
    _firestore.collection('tv_shows').doc();

    try{
      await _ref.set({
        'email': _email,
        'title': savedTvShow.title,
        'lang': savedTvShow.language,
        'genre1': savedTvShow.genre1,
        'genre2': savedTvShow.genre2,
        'relDate': savedTvShow.releaseDate,
        'timestamp': DateTime.now().millisecondsSinceEpoch
      });
    }
    catch (err) {
      throw Exception(err);
    }
  }

  Future<void> postPodcastonFirestore(SavedPodcast savedPodcast) async {
    await _auth.checkInternConnection();
    final _email = await getCurrentUserEmail();

    DocumentReference _ref =
    _firestore.collection('podcasts').doc();

    try{
      await _ref.set({
        'email': _email,
        'title': savedPodcast.title,
        'lang': savedPodcast.language,
        'genre1': savedPodcast.genre1,
        'genre2': savedPodcast.genre2,
        'relDate': savedPodcast.releaseDate,
        'timestamp': DateTime.now().millisecondsSinceEpoch
      });
    }
    catch (err) {
      throw Exception(err);
    }
  }
}