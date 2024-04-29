part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  
  const UsersState();

  @override
  List<Object?> get props => [];
}

final class UsersInitial extends UsersState {
  final String? userMail;
  final String? userPassword;
  const UsersInitial({this.userMail, this.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserLoading extends UsersState {
  
  const UserLoading();

  @override
  List<Object?> get props => [];
}

class UserSignedIn extends UsersState {

  final String? userMail;
  final String? userPassword;

  const UserSignedIn(
      {this.userMail, required this.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserLogedIn extends UsersState {
  final String? userMail;
  final String? userPassword;

  const UserLogedIn(
      {this.userMail, required this.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

final class UserError extends UsersState {
  const UserError();

  @override
  List<Object?> get props => [];
}

class UserResetPwState extends UsersState {

  final String? userMail;
  final String? userPassword;

  const UserResetPwState(
      {this.userMail, this.userPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserButtonClickState extends UsersState {

  const UserButtonClickState();

  @override
  List<Object?> get props => [];
}

class UserButtonUnClickState extends UsersState {

  const UserButtonUnClickState();

  @override
  List<Object?> get props => [];
}

class UserLogedInGoogle extends UsersState {
  final User? user;

  const UserLogedInGoogle(
      {this.user});

  @override
  List<Object?> get props => [user];
}

class UserLogedInApple extends UsersState {
  final User? user;

  const UserLogedInApple(
      {this.user});

  @override
  List<Object?> get props => [user];
}

