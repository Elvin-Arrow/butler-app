import 'package:butler_app/src/bloc/menu_bloc.dart';
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
    return Scaffold(
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
                  context.read<MenuBloc>().add(MovieEvent());
                  _goToLibraryPage(context);
                },
                icon: Icons.movie,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  context.read<MenuBloc>().add(BookEvent());
                  _goToLibraryPage(context);
                },
                icon: Icons.menu_book,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  context.read<MenuBloc>().add(MusicEvent());
                  _goToLibraryPage(context);
                },
                icon: Icons.queue_music,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  context.read<MenuBloc>().add(GameEvent());
                  _goToLibraryPage(context);
                },
                icon: Icons.videogame_asset,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  context.read<MenuBloc>().add(TVShowEvent());
                  _goToLibraryPage(context);
                },
                icon: Icons.tv,
                color: kBackgroundColor,
                iconSize: 42,
              ),
              CircularMenuItem(
                onTap: () {
                  context.read<MenuBloc>().add(PodcastEvent());
                  _goToLibraryPage(context);
                },
                icon: Icons.mic,
                color: kBackgroundColor,
                iconSize: 42,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Method to invoke the navigator object to transition to the
  /// library page
  void _goToLibraryPage(BuildContext context) {
    Navigator.pushNamed(context, SearchScreen.id);
  }
}
