import 'package:flutter/material.dart';

abstract class SavedItem{
  String title;
  String type;
  String language;
  String genre1;
  String genre2;
  String releaseDate;

  SavedItem({this.title, @required this.type, this.language = 'English', this.genre1 = 'null', this.genre2 = 'null', this.releaseDate});
}

class SavedMovie extends SavedItem{
  String popularity;

  SavedMovie({title, language, this.popularity, genre1, genre2, relD}){
    super.type = 'Movie';
    super.title = title;
    super.genre1 = genre1;
    super.genre2 = genre2;
    super.releaseDate = relD;
  }
}

class SavedBook extends SavedItem{
  String author = 'null';

  SavedBook({title, language, genre1, genre2, relD, this.author}){
    super.type = 'Book';
    super.title = title;
    super.genre1 = genre1;
    super.genre2 = genre2;
    super.releaseDate = relD;
  }
}

class SavedPodcast extends SavedItem{

  SavedPodcast({title, language, genre1, genre2, relD}){
    super.type = 'Podcast';
    super.title = title;
    super.genre1 = genre1;
    super.genre2 = genre2;
    super.releaseDate = relD;
  }
}

class SavedTVShow extends SavedItem{

  SavedTVShow({title, language, genre1, genre2, relD}){
    super.type = 'TV Show';
    super.title = title;
    super.genre1 = genre1;
    super.genre2 = genre2;
    super.releaseDate = relD;
  }
}

class SavedGame extends SavedItem{

  SavedGame({title, language, genre1, genre2, relD}){
    super.type = 'Game';
    super.title = title;
    super.genre1 = genre1;
    super.genre2 = genre2;
    super.releaseDate = relD;
  }
}