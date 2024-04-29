import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app/core/contants/fonts.dart';

class CustomizeElevatedLoginButtonIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final IconData icon;
  final Color iconColor;
  const CustomizeElevatedLoginButtonIcon({super.key, required this.buttonText, required this.icon, required this.iconColor, this.onTap});

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
                      height*0.015),
                      side: const BorderSide(color: Color(0xffd9d9d9)),
                ),
              ),
              fixedSize: MaterialStateProperty.all(Size(width, height * 0.07,),),
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(0),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: height*0.035, color: iconColor
                ,),
                SizedBox(width: width*0.02,),
                Text(
                  buttonText,
                  style: CustomizeFonts.insideLoginTextBlack,
                ),
              ],
            ),
          );
  }
}