part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}

final class UsersInitial extends UsersState {
  final String? userMail;
  const UsersInitial({this.userMail});

  @override
  List<Object?> get props => [userMail];
}

class UserLoading extends UsersState {
  const UserLoading();

  @override
  List<Object?> get props => [];
}

class UserSignedIn extends UsersState {
  final String? userMail;

  const UserSignedIn({this.userMail});

  @override
  List<Object?> get props => [userMail];
}

class UserLogedIn extends UsersState {
  final String? userMail;

  const UserLogedIn({this.userMail});

  @override
  List<Object?> get props => [userMail];
}

final class UserError extends UsersState {
  const UserError();

  @override
  List<Object?> get props => [];
}

class UserResetPwState extends UsersState {
  final String? userMail;

  const UserResetPwState({this.userMail});

  @override
  List<Object?> get props => [userMail];
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

  const UserLogedInGoogle({this.user});

  @override
  List<Object?> get props => [user];
}

class UserLogedInApple extends UsersState {
  final User? user;

  const UserLogedInApple({this.user});

  @override
  List<Object?> get props => [user];
}
