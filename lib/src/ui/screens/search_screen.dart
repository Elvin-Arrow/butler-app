import 'package:butler_app/src/bloc/library_bloc.dart';
import 'package:butler_app/src/bloc/menu_bloc.dart';
import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/services/movie_service.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  static const String id = 'search_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 12.0,
          ),
          height: size.height,
          width: size.width,
          color: kBackgroundColor,
          child: _setupScreenWidgets(context, size),
        ),
      ),
    );
  }

  /// Method to display content as per the currently emitted stated.
  /// The method also helps delivery the state to the search callback
  /// to search for a specific type of content like say, movies.
  ///
  Widget _setupScreenWidgets(BuildContext context, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _getNavLinks(),
        SizedBox(
          height: size.height / 24 - 10,
        ),
        Material(
          child: Search(
            onChanged: (val) {
              BlocProvider.of<LibraryBloc>(context).add(SearchEntryEvent(val));
            },
          ),
        ),
        BlocBuilder<MenuBloc, MenuState>(
          builder: (_, state) {
            return TextButton(
              onPressed: () {
                context
                    .read<LibraryBloc>()
                    .add(SearchEvent(_getSearchType(state)));
              },
              child: Text('Search'),
            );
          },
        ),
        Expanded(
          child: BlocBuilder<LibraryBloc, LibraryState>(builder: (_, state) {
            List<Results> result = [];
            if (state is SearchingLibrary) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieResultState) {
              result = state.searchResult.results;
              return ListView.builder(
                itemBuilder: (_, index) {
                  return Text(
                    result[index].title,
                    style: TextStyle(color: Colors.white),
                  );
                },
                itemCount: result.length,
              );
            }
            return Container();
          }),
        ),
      ],
    );
  }

  /// Method to get the navigation widgets that allow toggeling between
  /// the various content types and allow for search of selected content
  /// type.
  ///
  Widget _getNavLinks() {
    return BlocBuilder<MenuBloc, MenuState>(builder: (_, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.movie,
              color: state is MovieState
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.menu_book,
              color:
                  state is BookState ? kSelectedIconColour : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.queue_music,
              color: state is MusicState
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.videogame_asset,
              color:
                  state is GameState ? kSelectedIconColour : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.tv,
              color: state is TVShowState
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.mic,
              color: state is PodcastState
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
        ],
      );
    });
  }

  /// Method to get the search type based on the current content state.
  /// If none of the checked state match, the method will return the
  /// movie search type.
  ///
  SearchType _getSearchType(MenuState state) {
    SearchType searchType;

    if (state is TVShowState) {
      searchType = SearchType.TVShow;
    } else if (state is PodcastState) {
      searchType = SearchType.Podcast;
    } else if (state is MusicState) {
      searchType = SearchType.Music;
    } else if (state is GameState) {
      searchType = SearchType.Game;
    } else if (state is BookState) {
      searchType = SearchType.Book;
    } else {
      searchType = SearchType.Movie;
    }

    return searchType;
  }
}
