/* import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app_router.dart';
import 'package:flutter_ui_api_bloc/blocs/users_bloc/users_bloc.dart';
import 'package:flutter_ui_api_bloc/widgets/customize_elevated_button.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/helper_funtions.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPwController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {

    void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordController.text != confirmPwController.text) {
      context.router.maybePop();
      displayMessageToUser("Password don't match!", context);
    } else {
      try {
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        context.router.maybePop();
      } on FirebaseAuthException catch (e) {
        context.router.maybePop();
        displayMessageToUser(e.code, context);
      }
    }
  } 

    final _usersBloc = BlocProvider.of<UsersBloc>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          login: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.07,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextField(
                textController: usernameController,
                labelText: "Write your username",
                title: "Username",
              ),
              CustomTextField(
                textController: emailController,
                labelText: "Write your email",
                title: "Your Email",
              ),
              SizedBox(
                height: height * 0.015,
              ),
              CustomTextField(
                textController: passwordController,
                labelText: "Enter your password",
                title: "Password",
                showLabelText: true,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextField(
                textController: confirmPwController,
                labelText: "Re-enter your new password",
                title: "Confirm Password",
                showLabelText: true,
              ),
              SizedBox(
                height: height * 0.015,
              ),
            ],
          ),
          CustomizeElevatedButton(
            onTap: () {
              context.router.push(const FireBaseRoute());
            },
            buttonText: "Register",
            buttonActiveColor: const Color(
              0xff648DDB,
            ),
          ),
        ]),
      ),
    );
  }
} */