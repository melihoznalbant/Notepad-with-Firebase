import 'package:email_validator/email_validator.dart';
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
        emit(
          const UserLoading(),
        );
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.userMail!.text.trim(),
            password: event.userPassword!.text.trim(),
          );
          emit(UserSignedIn(
            userMail: event.userMail!.text.trim(),
            userPassword: event.userPassword!.text.trim(),
          ));
        } on FirebaseAuthException catch (e) {
          debugPrint(
            e.toString(),
          );
          emit(
            const UserError(),
          );
        }
      },
    );

    on<UserLogin>(
      (event, emit) async {
        emit(
          const UserLoading(),
        );
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.userMail!.text.trim(),
            password: event.userPassword!.text.trim(),
          );
          emit(
            UserLogedIn(
              userMail: event.userMail!.text.trim(),
              userPassword: event.userPassword!.text.trim(),
            ),
          );
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
        emit(
          const UserLoading(),
        );
        try {
          await FirebaseAuth.instance.signOut();
          emit(
            const UsersInitial(),
          );
        } on FirebaseAuthException catch (e) {
          debugPrint(
            e.toString(),
          );
          emit(
            const UserError(),
          );
        }
      },
    );

    on<UserInitial>(
      (event, emit) async {
        emit(
          const UsersInitial(),
        );
      },
    );

    on<UserResetPw>(
      (event, emit) async {
        try {
          await FirebaseAuth.instance.sendPasswordResetEmail(
            email: event.userMail!.text,
          );
          emit(const UserResetPwState());
        } catch (e) {
          emit(
            const UserError(),
          );
          emit(
          const UsersInitial(),
        );
        }
      },
    );

    on<UserButtonClick>(
      (event, emit) async {
          if (EmailValidator.validate(event.userMail!.text)) {
        emit(const UserButtonClickState());
      }
      },
    );
  }
}
