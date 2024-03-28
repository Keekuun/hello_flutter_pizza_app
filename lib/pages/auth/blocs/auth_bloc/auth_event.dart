part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthUserChanged extends AuthEvent {
  final MyUser? user;

  const AuthUserChanged(this.user);

  @override
  List<Object?> get props => [user];
}
