import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../app_router.dart';
import '../widgets/back_button.dart';
import '../widgets/custom_description_link.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_title.dart';
import '../widgets/customize_elevated_button.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
              const BackButtonWidget(),
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
              const CustomTextField(
                  labelText: "Enter your email", title: "Your Email"),
              SizedBox(
                height: height * 0.02,
              ),
              CustomizeElevatedButton(
                buttonText: "Reset Password",
                buttonActiveColor: const Color(
                  0xFF648DDB,
                ).withOpacity(
                  0.4,
                ),
                onTap: () => context.router.push(
                  const EmailCode2Route(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
