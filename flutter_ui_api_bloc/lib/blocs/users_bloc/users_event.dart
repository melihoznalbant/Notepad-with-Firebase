part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  final TextEditingController? userMail;
  final TextEditingController? userPassword;
  final TextEditingController? confirmUserPassword;
  const UsersEvent({this.userMail, this.userPassword, this.confirmUserPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

final class UserInitial extends UsersEvent {
  
  const UserInitial({super.userMail, super.userPassword, super.confirmUserPassword});

  @override
  List<Object?> get props => [userMail, userPassword, confirmUserPassword];
}

class UserLogin extends UserSignIn {
  
  const UserLogin({super.userMail, super.userPassword, super.confirmUserPassword});

  @override
  List<Object?> get props => [userMail, userPassword, confirmUserPassword];
}

final class UserLogout extends UsersEvent {

  const UserLogout({super.userMail, super.userPassword, super.confirmUserPassword});

  @override
  List<Object?> get props => [userMail, userPassword];
}

class UserSignIn extends UsersEvent {

  const UserSignIn ({super.userMail, super.userPassword, super.confirmUserPassword});

  @override
  List<Object?> get props => [userMail, userPassword, confirmUserPassword];
}
