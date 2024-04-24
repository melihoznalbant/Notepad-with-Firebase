import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/fonts.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.25,
                  height: height * 0.001,
                  color: const Color(0xffb3b3b3),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Text(
                  "Or",
                  style: CustomizeFonts.insideTextLabelGrey,
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Container(
                  width: width * 0.25,
                  height: height * 0.001,
                  color: const Color(0xffb3b3b3),
                ),
              ],
            );
  }
}