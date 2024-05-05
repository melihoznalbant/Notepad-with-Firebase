part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object?> get props => [];
}

final class UserInitialEvent extends UsersEvent {
  const UserInitialEvent();

  @override
  List<Object?> get props => [];
}

class UserLogin extends UsersEvent {
  final TextEditingController? userMail;
  final TextEditingController? userPassword;
  const UserLogin({this.userMail, this.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

final class UserLogout extends UsersEvent {
  const UserLogout();

  @override
  List<Object?> get props => [];
}

class UserSignUp extends UsersEvent {
  final TextEditingController? userMail;
  final TextEditingController? userPassword;
  const UserSignUp({this.userMail, this.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserResetPw extends UsersEvent {
  final TextEditingController? userMail;
  const UserResetPw({this.userMail});

  @override
  List<Object?> get props => [];
}

class UserGoogleLogin extends UsersEvent {
  const UserGoogleLogin();

  @override
  List<Object?> get props => [];
}

class UserAppleogin extends UsersEvent {
  const UserAppleogin();

  @override
  List<Object?> get props => [];
}
