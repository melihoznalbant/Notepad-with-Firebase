import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/blocs/users_bloc/users_bloc.dart';
import '../app_router.dart';
import '../widgets/back_button.dart';
import '../widgets/custom_description_link.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_title.dart';
import '../widgets/customize_elevated_button.dart';
import '../widgets/helper_funtions.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              BackButtonWidget(
                onTap: () {
                  context.read<UsersBloc>().add(const UserInitial());
                  context.router.maybePop();
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const CustomTitleWidget(customtitle: "Forgot password"),
              SizedBox(
                height: height * 0.02,
              ),
              const CustomDescriptionLinkWidget(
                  customDescription:
                      "Please enter your email to reset the password"),
              SizedBox(
                height: height * 0.03,
              ),
              CustomTextField(
                labelText: "Enter your email",
                title: "Your Email",
                textController: emailController,
                textInputType: TextInputType.emailAddress,
                onChanged: (text) {
                  if (EmailValidator.validate(emailController.text)){context
                      .read<UsersBloc>()
                      .add(UserButtonClick(userMail: emailController));} else {context.read<UsersBloc>().add(const UserInitial());}
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              BlocConsumer<UsersBloc, UsersState>(
                listener: (context, state) {
                  if (state is UserResetPw) {
                    context.router.push(
                      const EmailCode2Route(),
                    );
                  } else if (state is UserError) {
                    displayMessageToUser("Error", context);
                    emailController.clear();
                  }
                },
                builder: (context, state) {
                  return CustomizeElevatedButton(
                    splashFactory: state is UserButtonClickState
                        ? InkRipple.splashFactory
                        : NoSplash.splashFactory,
                    buttonText: "Reset Password",
                    buttonActiveColor: state is UserButtonClickState
                        ? const Color(
                            0xFF648DDB,
                          )
                        : const Color(
                            0xFF648DDB,
                          ).withOpacity(
                            0.4,
                          ),
                    onTap: () {
                            if(state is UserButtonClickState){
                              context.read<UsersBloc>().add(const UserResetPw());
                              emailController.clear();}
                          }
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
