import 'package:flutter/material.dart';

class SavedItem{
  String name;
  String type;
  String by;
  String language;

  SavedItem({this.name, @required this.type, this.by = 'null', this.language});
}