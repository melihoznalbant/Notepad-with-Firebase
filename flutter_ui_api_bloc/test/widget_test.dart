import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_api_bloc/widgets/custom_textfield.dart';

void main() {
  group('CustomTextField Tests', () {

    testWidgets('Genel Widget Test', (WidgetTester tester) async {
      TextEditingController controller = TextEditingController(text: 'Initial Text');
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            labelText: "Test Label",
            title: "Test Title",
            textController: controller,
            showLabelText: true,
          ),
        ),
      ));

      expect(find.text("Initial Text"), findsOneWidget);
      expect(find.text("Test Label"), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      TextField textField = tester.widget(find.byType(TextField));
      expect(textField.obscureText, true);

      final titleTextStyle = tester.widget<Text>(find.text("Test Title")).style;
      expect(titleTextStyle?.fontWeight, FontWeight.w600);
      expect(titleTextStyle?.fontSize, 16);
      expect(titleTextStyle?.color, const Color(0xff2a2a2a),);

      final border = textField.decoration?.border as OutlineInputBorder?;
      //expect(border?.borderRadius, BorderRadius.circular(5)); ????
      expect(border?.borderSide.width, 2);
      expect(border?.borderSide.color, const Color(0xffd9d9d9)); 

      final labelTextStyle = tester.widget<Text>(find.text("Test Label")).style;
      expect(labelTextStyle?.fontWeight, FontWeight.w500);
      expect(labelTextStyle?.fontSize, 16);
      expect(labelTextStyle?.color, const Color(0xffb3b3b3),);

      await tester.enterText(find.byType(TextField), "");
      expect(controller.text, "");
    },
    );
  },
  );
}
