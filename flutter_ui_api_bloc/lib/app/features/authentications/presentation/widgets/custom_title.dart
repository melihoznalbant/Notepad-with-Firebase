import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app/core/contants/fonts.dart';

class CustomTitleWidget extends StatelessWidget {
  final String customtitle;
  const CustomTitleWidget({super.key, required this.customtitle});

  @override
  Widget build(BuildContext context) {
    return Text(customtitle, style: CustomizeFonts.tittleBlack,);
  }
}