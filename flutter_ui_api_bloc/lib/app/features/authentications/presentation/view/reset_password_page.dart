
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app/router/app_router.dart';

import '../widgets/back_button.dart';
import '../widgets/custom_description_link.dart';
import '../widgets/custom_title.dart';
import '../widgets/customize_elevated_button.dart';

@RoutePage()
class ResetPassword2Page extends StatelessWidget {
  const ResetPassword2Page({super.key});

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
              const CustomTitleWidget(customtitle: "Password Reset"),
              SizedBox(
                height: height * 0.02,
              ),
              const CustomDescriptionLinkWidget(
                customDescription:
                    "Your password has been successfully reset. click confirm to set a new password",
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomizeElevatedButton(
                onTap:() => context.router.push(const SetPasswordRoute()),
                buttonText: "Confirm",
                buttonActiveColor: const Color(0xFF648DDB),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
