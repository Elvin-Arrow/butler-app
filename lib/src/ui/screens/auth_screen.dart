import 'package:butler_app/src/bloc/auth_bloc.dart';
import 'package:butler_app/src/resources/auth_repository.dart';
import 'package:butler_app/src/resources/utilities/constants.dart';
import 'package:butler_app/src/ui/screens/dashboard_screen.dart';
import 'package:butler_app/src/ui/widgets/modified_text_field.dart';
import 'package:butler_app/src/ui/widgets/rounded_rectanlge_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  static const String id = 'auth_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: _setupPageContent(context),
      ),
    );
  }

  /// Method reponsible for setting up the screen content based on
  /// the current event. If the event is of login type, the method
  /// will populate the screen with login widgets while if the event
  /// is register, the method will populate the screen with
  /// registeration widgets.
  ///
  Widget _setupPageContent(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (_, state) {
        if (state is AuthSuccess) {
          while (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          Navigator.pushReplacementNamed(context, DashboardScreen.id);
        }
      },
      builder: (_, state) {
        Widget contentWidget;

        if (state is LoginState) {
          contentWidget = _getContentWidget(context, AuthType.Login);
        } else if (state is RegisterState) {
          contentWidget = _getContentWidget(context, AuthType.Register);
        } else if (state is AuthLoading) {
          contentWidget = getLoadingWidget();
        }
        return LayoutBuilder(builder: (_, BoxConstraints constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(child: contentWidget),
            ),
          );
        });
      },
    );
  }

  /// Method responsible for returning the list of widgets based on the
  /// current state i.e. returning login widgets for login state and
  /// register widgets for register state.
  ///
  Widget _getContentWidget(BuildContext context, AuthType authType) {
    List<Widget> screenWidgets = [
      Column(
        children: [
          Hero(
            tag: 'logo',
            child: CircleAvatar(
              //foregroundColor: kSelectedIconColour,
              backgroundColor: kSelectedIconColour,
              child: Text(
                'B',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 66.0,
                    color: kBackgroundColor),
              ),
              radius: 46.0,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            'Butler',
            style: kTitleTextStyle.copyWith(
                color: kDefaultIconColour, fontSize: 36),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ];

    Widget authCredentialsWidget = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: authType == AuthType.Login
          ? _getLoginWidgets(context)
          : _getRegistrationWidgets(context),
    );

    List<Widget> authControlWidgets = [
      // Auth button, login or register
      RoundedRectangleButton(
        onPressed: () {
          context.read<AuthBloc>().add(AuthenticateEvent(authType));
        },
        buttonText: _getAuthenticationButtonText(authType),
        buttonColour: kDefaultIconColour,
        buttonTextColour: Colors.black,
      ),
    ];

    // Merge the children
    screenWidgets.add(authCredentialsWidget);
    screenWidgets.addAll(authControlWidgets);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: screenWidgets,
    );
  }

  /// Method to get login widgets.
  ///
  List<Widget> _getLoginWidgets(BuildContext context) {
    return [
      ModifiedTextField(
        label: 'Email',
        keyboardType: TextInputType.emailAddress,
        borderRadius: 44.0,
        prefixIcon: Icon(Icons.mail),
        onChanged: (credential) {
          context
              .read<AuthBloc>()
              .add(CredentialEntryEvent(credential, CredentialType.Email));
        },
      ),
      SizedBox(
        height: 24.0,
      ),
      ModifiedTextField(
        label: 'Password',
        obscureText: true,
        prefixIcon: Icon(Icons.vpn_key),
        borderRadius: 44.0,
        onChanged: (credential) {
          context
              .read<AuthBloc>()
              .add(CredentialEntryEvent(credential, CredentialType.Password));
        },
      ),
    ];
  }

  /// Method to get registration widgets.
  ///
  List<Widget> _getRegistrationWidgets(BuildContext context) {
    return [
      ModifiedTextField(
        label: 'Email',
        keyboardType: TextInputType.emailAddress,
        borderRadius: 44.0,
        prefixIcon: Icon(Icons.mail),
      ),
      SizedBox(
        height: 24.0,
      ),
      ModifiedTextField(
        prefixIcon: Icon(Icons.vpn_key),
        label: 'Password',
        obscureText: true,
        borderRadius: 44.0,
      ),
    ];
  }

  /// Method to get the authentication button text based on the
  /// current state, i.e. Login for login state and Register for
  /// register state.
  ///
  String _getAuthenticationButtonText(AuthType authType) {
    if (authType == AuthType.Login)
      return 'Login';
    else
      return 'Register';
  }
}

/// Method responsible for returning the circular progress indicator.
///
Widget getLoadingWidget() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
