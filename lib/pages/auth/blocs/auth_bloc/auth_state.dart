part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

sealed class AuthState extends Equatable {
  final AuthStatus status;
  final MyUser? user;

  // private constructor
  const AuthState._({this.status = AuthStatus.unknown, this.user});

  // named constructor
  const AuthState.unknown() : this._();

  // named constructor
  const AuthState.authenticated(MyUser myUser)
      : this._(status: AuthStatus.authenticated, user: myUser);

  // named constructor
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated, user: null);

  @override
  List<Object?> get props => [status, user];
}
