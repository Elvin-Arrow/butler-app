import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: kBackgroundColor,
      child: Center(
        child: _buildCircularMenu(context),
      ),
    );
  }

  /// Method to get the circular menu housing items pertaining to
  /// each search type.
  ///
  CircularMenu _buildCircularMenu(BuildContext context) {
    return CircularMenu(
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
            // TODO Add event
            // _goToLibraryPage(context, SearchType.Movie);
          },
          icon: Icons.movie,
          color: kBackgroundColor,
          iconSize: 42,
        ),
        CircularMenuItem(
          onTap: () {
            // TODO Add event
            // _goToLibraryPage(context, SearchType.Book);
          },
          icon: Icons.menu_book,
          color: kBackgroundColor,
          iconSize: 42,
        ),
        CircularMenuItem(
          onTap: () {
            // TODO Add event
            // _goToLibraryPage(context, SearchType.Music);
          },
          icon: Icons.queue_music,
          color: kBackgroundColor,
          iconSize: 42,
        ),
        CircularMenuItem(
          onTap: () {
            // TODO Add event
            // _goToLibraryPage(context, SearchType.Game);
          },
          icon: Icons.videogame_asset,
          color: kBackgroundColor,
          iconSize: 42,
        ),
        CircularMenuItem(
          onTap: () {
            // TODO Add event
            // _goToLibraryPage(context, SearchType.TVShow);
          },
          icon: Icons.tv,
          color: kBackgroundColor,
          iconSize: 42,
        ),
        CircularMenuItem(
          onTap: () {
            // TODO Add event
            // _goToLibraryPage(context, SearchType.Podcast);
          },
          icon: Icons.mic,
          color: kBackgroundColor,
          iconSize: 42,
        ),
      ],
    );
  }
}