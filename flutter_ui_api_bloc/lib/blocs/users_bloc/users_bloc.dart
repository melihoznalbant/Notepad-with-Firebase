import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
            const UsersInitial(userMail: null, userPassword: null),
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
          emit(UserResetPwState(userMail: event.userMail!.text));
        } catch (e) {
          debugPrint('Password reset error: $e');
          emit(
            const UserError(),
          );
        }
      },
    );

    on<UserButtonClick>(
      (event, emit) async {
        emit(const UserButtonClickState());
      },
    );

    on<UserGoogleLogin>(
      (event, emit) async {
        
        emit(
          const UserLoading(),
        );
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);
        try {
          emit(UserLogedInGoogle(user: userCredential.user));
        } catch (e) {
          debugPrint("Error: $e");
          emit(const UserError());
        }
      },
    );
  }
}