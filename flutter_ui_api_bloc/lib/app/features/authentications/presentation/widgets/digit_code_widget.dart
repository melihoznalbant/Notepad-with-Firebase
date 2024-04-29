import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCodeField extends StatefulWidget {
  const VerificationCodeField({super.key});

  @override
  VerificationCodeFieldState createState() => VerificationCodeFieldState();
}

class VerificationCodeFieldState extends State<VerificationCodeField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(5, (_) => TextEditingController());
    _focusNodes = List.generate(5, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  Color getBorderColor(int index) {
    // Odaklanmışsa veya içinde değer varsa mavi, değilse gri
    return _focusNodes[index].hasFocus || _controllers[index].text.isNotEmpty
        ? const Color(0xff648ddb)
        : const Color(0xffe1e1e1);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_controllers.length, (index) {
        // TextField'ın çerçeve rengini güncellemek için setState çağrılarını dinle
        _focusNodes[index].addListener(() {
          setState(() {});
        });
        _controllers[index].addListener(() {
          setState(() {});
        });

        return Container(
          width: width * 0.13,
          height: width * 0.13,
          alignment: Alignment.center,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    width * 0.04,
                  ),
                ),
                borderSide: BorderSide(
                  color: getBorderColor(
                    index,
                  ), // Dinamik olarak çerçeve rengi
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    width * 0.04,
                  ),
                ),
                borderSide: BorderSide(
                  color: getBorderColor(
                    index,
                  ), // Dinamik olarak çerçeve rengi
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    width * 0.04,
                  ),
                ),
                borderSide: BorderSide(
                  color: getBorderColor(
                    index,
                  ), // Dinamik olarak çerçeve rengi
                  width: 2,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.length == 1 && index < _controllers.length - 1) {
                FocusScope.of(context).requestFocus(
                  _focusNodes[index + 1],
                );
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(
                  _focusNodes[index - 1],
                );
              }
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        );
      }),
    );
  }
}
