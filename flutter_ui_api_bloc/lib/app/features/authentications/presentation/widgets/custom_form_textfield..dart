import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app/core/contants/fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final bool showLabelText;
  final String? title;
  final TextEditingController? textController;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final TextEditingController? textcontroller;
  const CustomTextFormField(
      {super.key,
      this.labelText,
      this.showLabelText = false,
      this.title,
      this.textController,
      this.textInputType = TextInputType.text,
      this.onChanged,
      this.textcontroller});

  @override
  State<CustomTextFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title.toString(),
          style: CustomizeFonts.subtittleBlack,
        ),
        SizedBox(
          height: height * 0.003,
        ),
        TextFormField(
          controller: widget.textcontroller,
          onChanged: widget.onChanged,
          keyboardType: widget.textInputType,
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
            hintText: widget.labelText,
            hintStyle: CustomizeFonts.insideTextLabelGrey,
          ),

          //labelText: widget.labelText, hintStyle: CustomizeFonts.insideTextLabelBlack,),
        )
      ],
    );
  }
}
