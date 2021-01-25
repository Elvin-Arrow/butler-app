part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class ShowLoginScreen extends AuthEvent {}

class ShowRegisterScreen extends AuthEvent {}

class AuthenticateEvent extends AuthEvent {
  final AuthType authType;

  AuthenticateEvent(this.authType);
}

class CredentialEntryEvent extends AuthEvent {
  final String credential;
  final CredentialType credentialType;

  CredentialEntryEvent(
    this.credential,
    this.credentialType,
  );
}
