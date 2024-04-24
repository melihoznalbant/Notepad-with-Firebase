import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app_router.dart';
import 'package:flutter_ui_api_bloc/widgets/back_button.dart';
import 'package:flutter_ui_api_bloc/widgets/custom_description_link.dart';
import 'package:flutter_ui_api_bloc/widgets/custom_textfield.dart';
import 'package:flutter_ui_api_bloc/widgets/custom_title.dart';
import 'package:flutter_ui_api_bloc/widgets/customize_elevated_button.dart';

@RoutePage()
class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

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
              const CustomTitleWidget(customtitle: "Set a new password"),
              SizedBox(
                height: height * 0.02,
              ),
              const CustomDescriptionLinkWidget(
                customDescription:
                    "Create a new password. Ensure it differs from previous ones for security",
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const CustomTextField(
                labelText: "Enter your new password",
                title: "Password",
                showLabelText: true,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              const CustomTextField(
                labelText: "Re-enter your new password",
                title: "Confirm Password",
                showLabelText: true,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomizeElevatedButton(
                buttonText: "Update Password",
                buttonActiveColor: const Color(0xFF648DDB),
                onTap: () => context.router.push(
                  const SuccessResetMailRoute(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
