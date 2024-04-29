import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app/core/contants/fonts.dart';

class CustomDescriptionLinkWidget extends StatelessWidget {
  final String customDescription;
  final String customDescriptionCont;
  final String emailLink;
  const CustomDescriptionLinkWidget({super.key, required this.customDescription, this.customDescriptionCont = "", this.emailLink=""});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        Text(customDescription, style: CustomizeFonts.descriptionGrey,softWrap: true,),
        Text(emailLink, style: CustomizeFonts.descriptionBlack,softWrap: true,),
        Text(customDescriptionCont, style: CustomizeFonts.descriptionGrey,softWrap: true,),
      ],
    );
  }
} 