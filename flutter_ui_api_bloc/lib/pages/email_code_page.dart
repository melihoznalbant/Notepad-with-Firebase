
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../app_router.dart';
import '../widgets/back_button.dart';
import '../widgets/custom_description_link.dart';
import '../widgets/custom_title.dart';
import '../widgets/customize_elevated_button.dart';
import '../widgets/digit_code_widget.dart';
import '../widgets/resend_email_text_button.dart';

@RoutePage()
class EmailCode2Page extends StatefulWidget {
  const EmailCode2Page({super.key});

  @override
  State<EmailCode2Page> createState() => _EmailCodePageState();
}

class _EmailCodePageState extends State<EmailCode2Page> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.015,),
              const BackButtonWidget(),
              SizedBox(height: height*0.03,),
              const CustomTitleWidget(customtitle: "Check your email"),
              SizedBox(height: height*0.02,),
              const CustomDescriptionLinkWidget(customDescription: "We sent a reset link to ", emailLink: "deneme@den...com", customDescriptionCont: "enter 5 digit code that mentioned in the email",),
              SizedBox(height: height*0.03,),
              const VerificationCodeField(),
              SizedBox(height: height*0.03,),
              CustomizeElevatedButton(onTap: () => context.router.push(const ResetPassword2Route()), buttonText: "Verify Code", buttonActiveColor: const Color(0xFF648DDB),),
              SizedBox(height: height*0.04,),
              const RecentEmailTextWidget(firstMessage: "Haven't got the email yet?",secondMessage: "Resend email",),
            ],
          ),
        ),
      ),
    );
  }
}