import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app_router.dart';
import 'package:flutter_ui_api_bloc/blocs/users_bloc/users_bloc.dart';
import 'package:flutter_ui_api_bloc/widgets/customize_elevated_button.dart';
import 'helper_funtions.dart';
import '../../widgets/custom_textfield.dart';
import 'customize_notification_text.dart';

class HomeRegister extends StatelessWidget {
  HomeRegister({super.key});

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

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
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          context.router.push(const FireBaseRoute());
        } on FirebaseAuthException catch (e) {
          
          displayMessageToUser(e.code, context);
        }
      }
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
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
            context.read().add(UserSignIn(userMail: usernameController, userPassword: passwordController, confirmUserPassword: confirmPwController));
          },
          buttonText: "Register",
          buttonActiveColor: const Color(
            0xff648DDB,
          ),
        ),
        SizedBox(
              height: height * 0.015,
            ),
        CustomizeNotificationText(
            greyText: "Do have an account?",
            bluText: "Sign in",
            onTap: () {
              DefaultTabController.of(context).animateTo(0);
            },
          ),
      ]),
    );
  }
}
