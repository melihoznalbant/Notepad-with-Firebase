part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  final TextEditingController? userMail;
  final TextEditingController? userPassword;

  const UsersEvent({this.userMail, this.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

final class UserInitial extends UsersEvent {
  
  const UserInitial({super.userMail, super.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserLogin extends UsersEvent {
  
  const UserLogin({super.userMail, super.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

final class UserLogout extends UsersEvent {

  const UserLogout({super.userMail, super.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserSignUp extends UsersEvent {

  const UserSignUp ({super.userMail, super.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserResetPw extends UsersEvent {

  const UserResetPw ({super.userMail, super.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserButtonClick extends UsersEvent {

  const UserButtonClick ({super.userMail, super.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserGoogleLogin extends UsersEvent {

  const UserGoogleLogin ({super.userMail, super.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}


