import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersInitial()) {
    on<UserSignUp>(
      (event, emit) async {
        emit(const UserLoading());

          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.userMail!.text,
              password: event.userPassword!.text,
            );
            emit(UserSignedIn(
                userMail: event.userMail!.text,
                userPassword: event.userPassword!.text,));
          } on FirebaseAuthException catch (e) {
            debugPrint(e.toString());
             emit(
              const UserError()
            );
          }
      },
    );

    on<UserLogin>(
      (event, emit) async {
        emit(const UserLoading());

        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.userMail!.text,
            password: event.userPassword!.text,
          );
          emit(UserLogedIn(
              userMail: event.userMail!.text,
              userPassword: event.userPassword!.text));
        } on FirebaseAuthException catch (e) {
          debugPrint(e.toString());
          emit(
            const UserError(),
          );
        }
      },
    );

    on<UserLogout>(
      (event, emit) async {
        emit(const UserLoading());

        try {
          await FirebaseAuth.instance.signOut();
          emit(const UsersInitial());
        } on FirebaseAuthException catch (e) {
          debugPrint(e.toString());
          emit(
            const UserError(),
          );
        }
      },
    );

    on<UserInitial>(
      (event, emit) async {
        emit(const UsersInitial());
      },
    );
  }
}
