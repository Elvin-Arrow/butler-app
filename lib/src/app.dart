import 'package:butler_app/src/bloc/auth_bloc.dart';
import 'package:butler_app/src/ui/screens/auth_screen.dart';
import 'package:butler_app/src/ui/screens/dashboard_screen.dart';
import 'package:butler_app/src/ui/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        routes: {
          LandingScreen.id: (context) => LandingScreen(),
          AuthScreen.id: (context) => AuthScreen(),
          DashboardScreen.id: (context) => DashboardScreen(),
        },
      ),
    );
  }
}
