import 'package:flutter/material.dart';
import 'package:treely/config/color_pallet.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  // final IconData icon;
  final TextInputType? keyboardType;
  final ValueChanged<String> onChanged;
  final Widget prefixWidget;
  const RoundedInputField({
    super.key,
    this.hintText,
    // this.icon = Icons.person,
    required this.onChanged,
    this.prefixWidget = const Icon(
      Icons.person,
      color: kSecondaryColor,
    ),
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          icon: prefixWidget,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
