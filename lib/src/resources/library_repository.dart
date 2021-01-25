import 'package:butler_app/src/resources/services/movie_service.dart';

enum SearchType {
  Movie,
  Book,
  Music,
  Game,
  TVShow,
  Podcast,
}

class LibraryRepository {
  MovieService _movieService;

  LibraryRepository() {
    _movieService = MovieService();
  }

  Future<MovieSearchResult> searchMovie(String query) async {
    return await _movieService.getMovieSearchResult(query);
  }
}
