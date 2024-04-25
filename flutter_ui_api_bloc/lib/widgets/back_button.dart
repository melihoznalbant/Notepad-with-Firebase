import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const BackButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {

    return Container(//margin: EdgeInsets.all(height*0.005),
                decoration: const BoxDecoration(
                  color: Color(0xffececec),
                  shape: BoxShape.circle,
                  
                ),child: BackButton(style: const ButtonStyle(), onPressed: onTap,),);
  }
}