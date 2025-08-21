import 'package:flutter/material.dart';
import 'package:socially/utils/constants/colors.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isObsecure;
  final String? Function(String?)? validator;

  const CustomInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.isObsecure,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(8),
    );

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        label: Text(labelText, style: TextStyle(color: mainWhiteColor),),
        filled: true,
      ),
      obscureText: isObsecure,
      validator: validator,
      
    );
  }
}
