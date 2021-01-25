import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:butler_app/src/models/auth_credentials.dart';
import 'package:meta/meta.dart';

import 'package:butler_app/src/resources/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthCredentials _authCredentials;

  AuthBloc(
    this._authRepository,
  ) : super(AuthInitial()) {
    _authCredentials = AuthCredentials();
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckAuthStatus) {
      final flag = await _authRepository.checkAuthStatus();
      if (flag)
        yield AlreadyAuthenticated();
      else
        yield LaunchAuth();
    } else if (event is ShowLoginScreen) {
      yield LoginState();
    } else if (event is ShowRegisterScreen) {
      yield RegisterState();
    } else if (event is CredentialEntryEvent) {
      _updateCredential(event.credentialType, event.credential);
    } else if (event is AuthenticateEvent) {
      yield AuthLoading();
      if (await _authenticateUser(event.authType)) {
        yield AuthSuccess();
      } else {
        yield AuthFailure();
      }
    }
  }

  Future<bool> _authenticateUser(AuthType authType) async {
    bool status;
    if (authType == AuthType.Login) {
      status = await _authRepository.login(_authCredentials);
    } else {
      status = await _authRepository.register(_authCredentials);
    }

    return status;
  }

  void _updateCredential(CredentialType credentialType, String credential) {
    if (credentialType == CredentialType.Email) {
      _authCredentials.updateEmail(credential);
    } else {
      _authCredentials.updatePassword(credential);
    }
  }
}
