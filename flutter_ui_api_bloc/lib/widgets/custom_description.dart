import 'package:flutter/material.dart';

import '../fonts.dart';

class CustomDescriptionWidget extends StatelessWidget {
  final String customDescription;
  const CustomDescriptionWidget({super.key, required this.customDescription});

  @override
  Widget build(BuildContext context) {
    return Text(customDescription, style: CustomizeFonts.descriptionGrey,);
  }
}