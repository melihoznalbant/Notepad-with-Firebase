part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  
  const UsersState();

  @override
  List<Object?> get props => [];
}

final class UsersInitial extends UsersState {
  const UsersInitial();

  @override
  List<Object?> get props => [];
}

class UserLoading extends UsersState {
  
  const UserLoading();

  @override
  List<Object?> get props => [];
}

class UserSignedIn extends UsersState {

  final TextEditingController? userMail;
  final TextEditingController? userPassword;

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
  final String? e;
  const UserError({this.e});

  @override
  List<Object?> get props => [];
}
