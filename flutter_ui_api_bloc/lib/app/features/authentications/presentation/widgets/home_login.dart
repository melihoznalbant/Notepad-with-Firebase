import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../router/app_router.dart';
import '../bloc/users_bloc/users_bloc.dart';
import 'custom_textfield.dart';
import 'customize_elevated_button.dart';
import 'customize_login_button.dart';
import 'customize_login_image_pic.dart';
import 'customize_notification_text.dart';
import 'separator.dart';
import 'wrong_forgot_password.dart';


class HomeLogin extends StatelessWidget {
  HomeLogin({super.key});


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.07,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
            labelText: "Write your password",
            title: "Password",
            showLabelText: true,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          ForgotWrongPassword(
            onTap: () {
              context.router.push(const ForgotPasswordRoute());
            },
          ),
          SizedBox(
            height: height * 0.015,
          ),
          CustomizeElevatedButton(
            onTap: () {
                //login();
                context.read<UsersBloc>().add(UserLogin(userMail: emailController, userPassword: passwordController),);
                
            },
            buttonText: "Continue",
            buttonActiveColor: const Color(
              0xff648DDB,
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          const SeparatorWidget(),
          SizedBox(
            height: height * 0.025,
          ),
          CustomizeElevatedLoginButtonIcon(
            onTap: () => context.read<UsersBloc>().add(const UserAppleogin()),
            buttonText: "Login with Apple",
            icon: Icons.apple,
            iconColor: Colors.black,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          CustomizeElevatedLoginButtonImage(
            onTap: () {
              context.read<UsersBloc>().add(const UserGoogleLogin());
            },
            buttonText: "Login with Google",
            imageUrl: "assets/google.png",
          ),
          SizedBox(
            height: height * 0.035,
          ),
          CustomizeNotificationText(
            greyText: "Don't have an account?",
            bluText: "Sign up",
            onTap: () {
              DefaultTabController.of(context).animateTo(1);
            },
          ),
        ],
      ),
    );
  }
}
