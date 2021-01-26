import 'package:butler_app/src/resources/services/books_service.dart';
import 'package:butler_app/src/resources/services/game_service.dart';
import 'package:butler_app/src/resources/services/movie_service.dart';
import 'package:butler_app/src/resources/services/music_service.dart';
import 'package:butler_app/src/resources/services/podcast_service.dart';
import 'package:butler_app/src/resources/services/tv_show_service.dart';

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
  BooksService _booksService;
  GameService _gameService;
  MusicService _musicService;
  PodcastService _podcastService;
  TVShowService _tvShowService;

  LibraryRepository() {
    _movieService = MovieService();
    _booksService = BooksService();
    _gameService = GameService();
    _musicService = MusicService();
    _podcastService = PodcastService();
    _tvShowService = TVShowService();
  }

  Future<MovieSearchResult> searchMovie(String query) async {
    return await _movieService.getMovieSearchResult(query);
  }

  Future<BookSearchResult> searchBook(String query) async {
    return await _booksService.getBooksSearch(query);
  }

  Future<GameSearchResult> searchGame(String query) async {
    return await _gameService.getGamesSearch(query);
  }

  Future<MusicSearchResult> searchMusic(String query) async {
    return await _musicService.getMusicSearch(query);
  }

  Future<PodcastSearchResult> searchPodcast(String query) async {
    return await _podcastService.getPodcastSearch(query);
  }

  Future<TVShowSearchResult> searchTvShow(String query) async {
    return await _tvShowService.getTvSearchResult(query);
  }
}
