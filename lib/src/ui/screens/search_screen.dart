import 'package:auto_size_text/auto_size_text.dart';
import 'package:butler_app/src/bloc/library_bloc.dart';
import 'package:butler_app/src/models/genre_model.dart';
import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/search_repository.dart';
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
              context.read<LibraryBloc>().add(SearchEntryEvent(val));
            },
          ),
        ),
        BlocBuilder<LibraryBloc, LibraryState>(
          builder: (_, state) {
            return TextButton(
              onPressed: () {
                SearchType searchType = _getSearchType(state);
                context.read<LibraryBloc>().add(SearchEvent(searchType));
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
              result = state.movieState.searchResult.results;
              return ListView.builder(
                itemBuilder: (_, index) {
                  // return Text(
                  //   result[index].title,
                  //   style: TextStyle(color: Colors.white),
                  // );
                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Container(
                              width: 1,
                              height: 100,
                              color: kSelectedIconColour,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: kDefaultIconColour),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: size.width - 150,
                                  child: AutoSizeText(
                                    result[index].title,
                                    style: TextStyle(
                                        color: kDefaultIconColour,
                                        fontSize: 20),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    minFontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text(
                                    'Popularity: ${SearchRepository().getPopularity(result[index].popularity)}',
                                    style: TextStyle(
                                        color: kDefaultIconColour,
                                        fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text(
                                    'Release Date: ${(result[index].releaseDate)}',
                                    style: TextStyle(
                                        color: kDefaultIconColour,
                                        fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 66,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            color: kDullBlueColor),
                                        child: Center(
                                          child: Text(
                                            MovieGenre.getFirstGenreName(
                                                result[index]),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kDefaultIconColour),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 66,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            color: kDullBlueColor),
                                        child: Center(
                                          child: Text(
                                            MovieGenre.getSecondGenreName(
                                                result[index]),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kDefaultIconColour),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
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
    return BlocBuilder<LibraryBloc, LibraryState>(builder: (_, state) {
      SearchType searchType = _getSearchType(state);

      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.movie,
              color: searchType == SearchType.Movie
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.menu_book,
              color: searchType == SearchType.Book
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.queue_music,
              color: searchType == SearchType.Music
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.videogame_asset,
              color: searchType == SearchType.Game
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.tv,
              color: searchType == SearchType.TVShow
                  ? kSelectedIconColour
                  : kDefaultIconColour,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.mic,
              color: searchType == SearchType.Podcast
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
  SearchType _getSearchType(LibraryState state) {
    SearchType searchType = SearchType.Movie;

    if (state is SearchState) {
      searchType = state.searchType;
    } else if (state is SearchingLibrary) {
      searchType = state.searchType;
    } else if (state is MovieResultState) {
      searchType = state.movieState.searchType;
    }

    return searchType;
  }
}
