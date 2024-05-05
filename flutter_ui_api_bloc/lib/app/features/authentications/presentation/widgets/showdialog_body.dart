import 'package:flutter/material.dart';

import '../../../../core/contants/fonts.dart';

class ShowDialogBodyWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? docID;
  const ShowDialogBodyWidget({super.key, this.onTap, this.docID});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: docID == null
          ? Text(
              "Add",
              style: CustomizeFonts.insideTextLabelGrey,
            )
          : Text(
              "Update",
              style: CustomizeFonts.insideTextLabelGrey,
            ),
    );
  }
}
