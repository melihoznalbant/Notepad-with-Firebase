import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/fonts.dart';

class CustomizeNotificationText extends StatelessWidget {
  final VoidCallback? onTap;
  final String greyText;
  final String bluText;
  
  const CustomizeNotificationText({
    super.key, 
    required this.greyText, 
    required this.bluText, 
    this.onTap 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(greyText, style: CustomizeFonts.notificationTextGrey),
        if (onTap != null)
          InkWell(
            onTap: onTap,
            child: Text(bluText, style: CustomizeFonts.notificationTextBlue),
          ),
        if (onTap == null)
          Text(bluText, style: CustomizeFonts.notificationTextBlue),
      ],
    );
  }
}
