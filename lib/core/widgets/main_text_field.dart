import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    required this.label,
    this.width,
    this.controller,
    this.suffixIcon,
    this.readOnly,
    this.validator,
    this.isObscured = false,
  });

  final String ?label;
  final double? width;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool isObscured;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * .9,
        child: TextFormField(
          validator: validator,
          readOnly: readOnly ?? false,
          controller: controller,
          obscureText: isObscured,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
          ),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
