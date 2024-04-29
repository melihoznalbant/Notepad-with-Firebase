import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app/core/contants/fonts.dart';

class RecentEmailTextWidget extends StatelessWidget {
  final String firstMessage;
  final String secondMessage;
  const RecentEmailTextWidget({super.key, required this.firstMessage, required this.secondMessage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstMessage, style: CustomizeFonts.descriptionGrey,),
        Text(secondMessage, style: CustomizeFonts.descriptionBlueUnderLine,),
      ],
    );
  }
}