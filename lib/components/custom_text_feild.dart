import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String? textFeildName;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isRequired;
  final controller;

  String? Function(String?)? validator;
  CustomTextFeild({
    Key? key,
    required this.hintText,
    this.textFeildName,
    this.suffixIcon,
    this.obscureText = false,
    this.isRequired = false,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: textFeildName,
            style: const TextStyle(color: Colors.black),
            children: [
              isRequired
                  ? const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  : const TextSpan(text: ''),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(height: 1.6),
          obscureText: obscureText,
          keyboardType: null,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF2F2F7),
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
