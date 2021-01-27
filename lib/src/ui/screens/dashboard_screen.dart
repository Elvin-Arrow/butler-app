import 'package:butler_app/src/bloc/library_bloc.dart';
import 'package:butler_app/src/bloc/tab_bloc.dart';
import 'package:butler_app/src/ui/screens/home_screen.dart';
import 'package:butler_app/src/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/library_bloc.dart';
import 'search_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = 'dashboard_screen';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // TODO take the implementation out
      onWillPop: () =>
          showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Text("NO"),
                ),
                SizedBox(height: 16),
                new GestureDetector(
                  onTap: () => Navigator.of(context).pop(true),
                  child: Text("YES"),
                ),
              ],
            ),
          ) ??
          false,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _getBottomNavbarItems(),
          onTap: (tabIndex) {
            context.read<TabBloc>().add(TabChangeEvent(tabIndex));
          },
        ),
        body: SafeArea(
          child: BlocBuilder<TabBloc, TabState>(builder: (_, state) {
            Widget screenContent;
            if (state is TabInitial) {
              screenContent = HomeScreen();
            } else if (state is SearchTab) {
              screenContent = SearchScreen();
            } else if (state is SettingsTab) {
              // TODO Add settings
            }
            return screenContent ?? Container();
          }),
        ),
      ),
    );
  }

  /// Method to get the bottom navigation bar items.
  ///
  List<BottomNavigationBarItem> _getBottomNavbarItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.local_library_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];
  }
}
