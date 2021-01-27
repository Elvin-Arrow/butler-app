part of 'tab_bloc.dart';

@immutable
abstract class TabState {}

class TabInitial extends TabState {}

class SearchTab extends TabState {}

class SettingsTab extends TabState {}
