import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/bloc/users_bloc/users_bloc.dart';
import 'custom_textfield.dart';
import 'customize_elevated_button.dart';
import 'helper_funtions.dart';
import 'customize_notification_text.dart';

class HomeRegister extends StatelessWidget {
  HomeRegister({super.key});

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

  @override
  Widget build(BuildContext context) {

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
            if (passwordController.text == confirmPwController.text) {
              context.read<UsersBloc>().add(UserSignUp(
                userMail: emailController,
                userPassword: passwordController,),);
            } else {
              displayMessageToUser("Password don't match!", context);
              passwordController.clear();
              confirmPwController.clear();
            }
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
