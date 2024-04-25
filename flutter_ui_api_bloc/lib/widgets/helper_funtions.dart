import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
}

Future<void> resetPassword(String email, BuildContext context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  showDialog(
    context: context, 
    builder: (BuildContext context) {
      Timer(const Duration(seconds: 2), () {
        context.router.maybePop(); 
      });

      return const AlertDialog(
        title: Text("Password Reset Email Sent"),
        content: Text("Please check your email to reset your password."),
      );
    },
  );
  } catch (e) {
    showDialog(
    context: context, 
    builder: (BuildContext context) {
      Timer(const Duration(seconds: 2), () {
        context.router.maybePop(); 
      });

      return AlertDialog(
        title: Text("Error ${e.toString()}"),
      );
    },
  );
  }
}
