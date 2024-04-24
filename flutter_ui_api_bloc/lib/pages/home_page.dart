/* import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app_router.dart';
import 'package:flutter_ui_api_bloc/blocs/users_bloc/users_bloc.dart';
import 'package:flutter_ui_api_bloc/pages/firebase_page.dart';
import 'package:flutter_ui_api_bloc/widgets/home_login.dart';
import 'package:flutter_ui_api_bloc/widgets/home_register.dart';

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
    final _userBloc = BlocProvider.of<UsersBloc>(context);

    const TextStyle selectedStyle = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    );

    const TextStyle unselectedStyle = TextStyle(
      color: Colors.grey,
    );

    return SafeArea(
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersInitial || state is UserLogout) {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
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
                  children: [const HomeLogin(), HomeRegister()],
                ),
              ),
            );
          } else if (state is UserLogingIn) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLogedIn || state is UserSignedIn) {
            return const FireBasePage();
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Error"),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            _userBloc.add(const UserInitial());
                           // context.router.push(const AuthRoute());
                          },
                          child: const Text("Try again")),
                    )
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
 */


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app_router.dart';
import 'package:flutter_ui_api_bloc/blocs/users_bloc/users_bloc.dart';
import 'package:flutter_ui_api_bloc/widgets/home_login.dart';
import 'package:flutter_ui_api_bloc/widgets/home_register.dart';

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

    final _usersBloc = BlocProvider.of<UsersBloc>(context);

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
          if (state is UserLogedIn || state is UserSignedIn) {
            context.router.push(const FireBaseRoute());
          }
        },
        builder: (context, state) {
          if (state is UsersInitial){return DefaultTabController(
            length: 2,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
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
                  children: [const HomeLogin(), HomeRegister()],
                ),
              ),
            ),
          );} else if (state is UserLoading) {
            return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
          } else if (state is UserError) {
            return  Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text("Error: ${state.e}"),
                  ElevatedButton(onPressed:() {
                    _usersBloc.add(const UserInitial());
                  }, child: const Text("Try Again"))
                ],
              ),
            ),
          );
          } else {
            return  Scaffold(
            body: Center(
              child: Column(
                children: [
                  const Text("Error"),
                  ElevatedButton(onPressed:() {
                    _usersBloc.add(const UserInitial());
                  }, child: const Text("Try Again"))
                ],
              ),
            ),
          );}
        },
      ),
    );
  }
}
