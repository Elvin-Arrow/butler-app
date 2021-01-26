import 'package:butler_app/src/bloc/library_bloc.dart';
import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/screens/search_screen.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = 'dashboard_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LibraryBloc, LibraryState>(
      listener: (_, state) {
        if (state is! LibraryInitial) {
          Navigator.pushNamed(context, SearchScreen.id);
        }
      },
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: kBackgroundColor,
          child: Center(
            child: CircularMenu(
              alignment: Alignment.center,
              radius: 100,
              animationDuration: Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              reverseCurve: Curves.fastOutSlowIn,
              startingAngleInRadian: 0,
              endingAngleInRadian: 5.3,
              // main button
              toggleButtonColor: kBackgroundColor,
              toggleButtonBoxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10,
                ),
              ],
              toggleButtonIconColor: kDefaultIconColour,
              toggleButtonMargin: 10.0,
              toggleButtonPadding: 20.0,
              toggleButtonSize: 48.0,
              toggleButtonAnimatedIconData: AnimatedIcons.search_ellipsis,
              items: [
                CircularMenuItem(
                  onTap: () {
                    _goToLibraryPage(context, SearchType.Movie);
                  },
                  icon: Icons.movie,
                  color: kBackgroundColor,
                  iconSize: 42,
                ),
                CircularMenuItem(
                  onTap: () {
                    _goToLibraryPage(context, SearchType.Book);
                  },
                  icon: Icons.menu_book,
                  color: kBackgroundColor,
                  iconSize: 42,
                ),
                CircularMenuItem(
                  onTap: () {
                    _goToLibraryPage(context, SearchType.Music);
                  },
                  icon: Icons.queue_music,
                  color: kBackgroundColor,
                  iconSize: 42,
                ),
                CircularMenuItem(
                  onTap: () {
                    _goToLibraryPage(context, SearchType.Game);
                  },
                  icon: Icons.videogame_asset,
                  color: kBackgroundColor,
                  iconSize: 42,
                ),
                CircularMenuItem(
                  onTap: () {
                    _goToLibraryPage(context, SearchType.TVShow);
                  },
                  icon: Icons.tv,
                  color: kBackgroundColor,
                  iconSize: 42,
                ),
                CircularMenuItem(
                  onTap: () {
                    _goToLibraryPage(context, SearchType.Podcast);
                  },
                  icon: Icons.mic,
                  color: kBackgroundColor,
                  iconSize: 42,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Method to raise the selection event and to invoke the navigator
  /// object to transition to the library page.
  ///
  void _goToLibraryPage(BuildContext context, SearchType searchType) {
    // Raise selection event
    context.read<LibraryBloc>().add(SearchTypeSelectEvent(searchType));

    // Navigate to the next screen
    // Navigator.pushNamed(context, SearchScreen.id);
  }
}
