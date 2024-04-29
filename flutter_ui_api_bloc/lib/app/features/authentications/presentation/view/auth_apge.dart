import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/bloc/users_bloc/users_bloc.dart';

import 'firebase_page.dart';
import 'home_page.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const FireBasePage();
                } else {
                  return const MyHomePage();
                }
              },
            );
          },
        ),
      ),
    );
  }
}