import 'package:butler_app/src/resources/services/movie_service.dart';

class MovieGenre {
  static const Map<String, String> genres = {
    '28': "Action",
    '12': "Adventure",
    '16': "Animation",
    '35': "Comedy",
    '80': "Crime",
    '99': "Documentary",
    '18': "Drama",
    '10751': "Family",
    '14': "Fantasy",
    '36': "History",
    '27': "Horror",
    '10402': "Music",
    '9648': "Mystery",
    '10749': "Romance",
    '878': "Fiction",
    '10770': "TV Movie",
    '53': "Thriller",
    '10752': "War",
    '37': "Western"
  };

  static getGenreName(int id){
    try{
      return genres[id.toString()];
    }
    catch (err){
      return 'Unknown';
    }
  }

  static getSecondGenreName(Results result){
    int genreId;
    try {
      genreId = result.genreIds[1];
    }
    catch (_) {
      return '- -';
    }
    return getGenreName(genreId);
  }

  static getFirstGenreName(Results result){
    int genreId;
    try {
      genreId = result.genreIds[0];
    }
    catch (_) {
      return '- -';
    }
    return getGenreName(genreId);
  }
}
