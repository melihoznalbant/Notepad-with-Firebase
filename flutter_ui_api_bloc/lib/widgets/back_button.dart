import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(//margin: EdgeInsets.all(height*0.005),
                decoration: const BoxDecoration(
                  color: Color(0xffececec),
                  shape: BoxShape.circle,
                  
                ),child: const BackButton(style: ButtonStyle(),),);
  }
}