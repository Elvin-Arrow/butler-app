import 'package:butler_app/src/bloc/auth_bloc.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/screens/auth_screen.dart';
import 'package:butler_app/src/ui/screens/dashboard_screen.dart';
import 'package:butler_app/src/ui/screens/library_screen.dart';
import 'package:butler_app/src/ui/widgets/rounded_rectanlge_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatelessWidget {
  static const String id = 'landing_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (_, state) {
              if (state is LoginState || state is RegisterState) {
                Navigator.pushNamed(context, AuthScreen.id);
              } else if (state is AlreadyAuthenticated) {
                Navigator.pushReplacementNamed(context, DashboardScreen.id);
              }
            },
            // ignore: missing_return
            builder: (_, state) {
              if (state is AuthInitial) {
                context.read<AuthBloc>().add(CheckAuthStatus());
                return getLoadingWidget();
              } else if (state is LaunchAuth) {
                return _getContentWidget(context);
              } else
                return Container();
            },
          ),
        ),
      ),
    );
  }

  /// Method to acquire the widgets for displaying the login and register
  /// control widgets on the screen along with the decorating content.
  ///
  Widget _getContentWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Hero(
          tag: 'logo',
          child: CircleAvatar(
            backgroundColor: kSelectedIconColour,
            child: Text(
              'B',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 66.0,
                color: kBackgroundColor,
              ),
            ),
            radius: 46.0,
          ),
        ),
        SizedBox(
          height: 24.0,
        ),
        Text(
          'Butler',
          style:
              kTitleTextStyle.copyWith(color: kDefaultIconColour, fontSize: 36),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        RoundedRectangleButton(
          onPressed: () {
            context.read<AuthBloc>().add(ShowLoginScreen());
          },
          buttonText: 'Sign In',
          buttonColour: kSelectedIconColour,
          buttonTextColour: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        RoundedRectangleButton(
          onPressed: () {
            context.read<AuthBloc>().add(ShowRegisterScreen());
          },
          buttonText: 'Sign up',
        ),
      ],
    );
  }
}
