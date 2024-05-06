import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersInitial()) {
    on<UserSignUp>(
      _onUserSignUp,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
    on<UserLogin>(
      _onUserLogin,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
    on<UserLogout>(
      _onUserLogout,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
    on<UserInitialEvent>(
      _onUserInitialEvent,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
    on<UserResetPw>(
      _onUserResetPw,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
    on<UserGoogleLogin>(
      _onUserGoogleLogin,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
    on<UserAppleogin>(
      _onUserAppleogin,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
  }

  Future<void> _onUserSignUp(UserSignUp event, Emitter<UsersState> emit) async {
    emit(const UserLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.userMail!.text.trim(),
        password: event.userPassword!.text.trim(),
      );
      emit(UserSignedIn(userMail: event.userMail!.text.trim()));
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      emit(const UserError());
    }
  }

  Future<void> _onUserLogin(UserLogin event, Emitter<UsersState> emit) async {
    emit(const UserLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.userMail!.text.trim(),
        password: event.userPassword!.text.trim(),
      );
      emit(
        UserLogedIn(userMail: event.userMail!.text.trim()),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      emit(const UserError());
    }
  }

  Future<void> _onUserLogout(UserLogout event, Emitter<UsersState> emit) async {
    emit(const UserLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(
        const UsersInitial(
          userMail: null,
        ),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      emit(const UserError());
    }
  }

  Future<void> _onUserInitialEvent(
      UserInitialEvent event, Emitter<UsersState> emit) async {
    emit(
      const UsersInitial(),
    );
    debugPrint(state.toString());
  }

  Future<void> _onUserResetPw(
      UserResetPw event, Emitter<UsersState> emit) async {
    emit(const UserLoading());
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: event.userMail!.text);
      emit(UserResetPwState(userMail: event.userMail!.text));
    } catch (e) {
      debugPrint('Password reset error: $e');
      emit(const UserError());
    }
  }

  Future<void> _onUserGoogleLogin(
      UserGoogleLogin event, Emitter<UsersState> emit) async {
    emit(const UserLoading());
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
  }

  Future<void> _onUserAppleogin(
      UserAppleogin event, Emitter<UsersState> emit) async {
    emit(const UserLoading());
    try {
      String generateNonce([int length = 32]) {
        const charset =
            '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
        final random = Random.secure();
        return List.generate(
            length, (_) => charset[random.nextInt(charset.length)]).join();
      }

      String sha256ofString(String input) {
        final bytes = utf8.encode(input);
        final digest = sha256.convert(bytes);
        return digest.toString();
      }

      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      emit(const UserLogedInApple());
    } catch (e) {
      debugPrint("Error: $e");
      emit(const UserError());
    }
  }
}
