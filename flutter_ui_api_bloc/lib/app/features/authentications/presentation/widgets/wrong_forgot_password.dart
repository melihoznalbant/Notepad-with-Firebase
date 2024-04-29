import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_api_bloc/app/core/contants/fonts.dart';

class ForgotWrongPassword extends StatelessWidget {
  final VoidCallback onTap;
  const ForgotWrongPassword({super.key, this.onTap = defaultFunction});

  static void defaultFunction() {}

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wrong Password",
                  style: CustomizeFonts.subtittleGrey,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Forgot Password?",
                    style: CustomizeFonts.subtittleBlue,
                  ),
                ),
              ],
            );
  }
}