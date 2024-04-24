import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/fonts.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool showLabelText;
  final String title;
  final TextEditingController? textController;
  const CustomTextField({super.key, required this.labelText, this.showLabelText=false, required this.title, this.textController});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
  
    double height = MediaQuery.of(context).size.height;

    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: CustomizeFonts.subtittleBlack,
            ),
            SizedBox(height: height*0.003,),
            TextField(
              controller: widget.textController ?? TextEditingController(),
              obscureText: widget.showLabelText,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      height * 0.01,
                    ),
                    borderSide: const BorderSide(
                      color: Color(
                        0xffd9d9d9,
                      ),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      height * 0.01,
                    ),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 220, 122, 122),
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      height * 0.01,
                    ),
                    borderSide: const BorderSide(
                      color: Color(
                        0xffd9d9d9,
                      ),
                      width: 2,
                    ),
                  ),
                  hintText: widget.labelText, hintStyle: CustomizeFonts.insideTextLabelGrey,),
                  
                  //labelText: widget.labelText, hintStyle: CustomizeFonts.insideTextLabelBlack,),
            )
          ],
        );
  }
}