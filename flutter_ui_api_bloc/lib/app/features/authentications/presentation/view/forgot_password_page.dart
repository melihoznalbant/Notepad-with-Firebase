import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/bloc/users_bloc/users_bloc.dart';
import '../../../../router/app_router.dart';
import '../widgets/back_button.dart';
import '../widgets/custom_description_link.dart';
import '../widgets/custom_form_textfield..dart';
import '../widgets/custom_title.dart';
import '../widgets/customize_elevated_button.dart';
import '../widgets/helper_funtions.dart';

@RoutePage()
class ForgotPasswordPage extends HookWidget {
  const ForgotPasswordPage({super.key});

  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final emailController = useTextEditingController();

    useValueListenable(emailController);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.015,
                ),
                BackButtonWidget(
                  onTap: () {
                    context.read<UsersBloc>().add(const UserInitialEvent());
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
                CustomTextFormField(
                  textcontroller: emailController,
                  labelText: "Enter your email",
                  title: "Your Email",
                  textController: emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                BlocListener<UsersBloc, UsersState>(
                    listener: (context, state) {
                      if (state is UserResetPwState) {
                        context.router.push(
                          const EmailCode2Route(),
                        );
                        emailController.clear();
                      } else if (state is UserError) {
                        displayMessageToUser("Error", context);
                        emailController.clear();
                      } else if (state is UserLoading) {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Center(child: CircularProgressIndicator()),
                          ),
                        );
                      }
                    },
                    child: CustomizeElevatedButton(
                        buttonText: "Reset Password",
                        buttonActiveColor:
                            customTextFieldValidator(emailController.text)
                                ? const Color(
                                    0xFF648DDB,
                                  )
                                : const Color(
                                    0xFF648DDB,
                                  ).withOpacity(
                                    0.4,
                                  ),
                        onTap: !customTextFieldValidator(emailController.text)
                            ? null
                            : () {
                                context.read<UsersBloc>().add(
                                    UserResetPw(userMail: emailController));
                                //context.router.push(const EmailCode2Route());
                              })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool customTextFieldValidator(String textFieldValue) {
    if (EmailValidator.validate(textFieldValue)) {
      return true;
    } else {
      return false;
    }
  }
}
