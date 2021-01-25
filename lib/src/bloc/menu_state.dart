part of 'menu_bloc.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class MovieState extends MenuState {}

class PodcastState extends MenuState {}

class MusicState extends MenuState {}

class GameState extends MenuState {}

class BookState extends MenuState {}

class TVShowState extends MenuState {}
