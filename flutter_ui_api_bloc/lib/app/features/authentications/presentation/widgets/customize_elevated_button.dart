import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app/core/contants/fonts.dart';

class CustomizeElevatedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final Color buttonActiveColor;
  // ignore: avoid_init_to_null
  const CustomizeElevatedButton({super.key, required this.buttonText, required this.buttonActiveColor, this.onTap = null,});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      height*0.015), // Köşelerin yuvarlaklık derecesi
                ),
              ),
              fixedSize: MaterialStateProperty.all(Size(width, height * 0.07)),
              backgroundColor: MaterialStateProperty.all(
                buttonActiveColor,
              ),
            ),
            child: Text(
              buttonText,
              style: CustomizeFonts.buttonTextWhite,
            ),
          );
  }
}