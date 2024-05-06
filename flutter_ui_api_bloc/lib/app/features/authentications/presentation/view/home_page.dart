import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app/router/app_router.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/bloc/users_bloc/users_bloc.dart';

import '../bloc/stream_bloc/stream_bloc.dart';
import '../widgets/home_login.dart';
import '../widgets/home_register.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const TextStyle selectedStyle = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    );

    const TextStyle unselectedStyle = TextStyle(
      color: Colors.grey,
    );

    return SafeArea(
      child: BlocConsumer<UsersBloc, UsersState>(
        listener: (context, state) {
          if (state is UserLogedIn ||
              state is UserSignedIn ||
              state is UserLogedInGoogle ||
              state is UserLogedInApple) {
            context.router.replace(const FireBaseRoute());
            context.read().add(LoadNotesEvent());
          }
        },
        builder: (context, state) {
          if (state is UsersInitial) {
            return DefaultTabController(
              length: 2,
              child: SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    bottom: const TabBar(
                      indicatorColor: Colors.blue,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: selectedStyle,
                      unselectedLabelStyle: unselectedStyle,
                      tabs: [
                        Tab(
                          child: Text(
                            "Log In",
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Sign Up",
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [HomeLogin(), HomeRegister()],
                  ),
                ),
              ),
            );
          } else if (state is UserLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  children: [
                    const Text("Error"),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<UsersBloc>()
                              .add(const UserInitialEvent());
                        },
                        child: const Text("Try Again"))
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
