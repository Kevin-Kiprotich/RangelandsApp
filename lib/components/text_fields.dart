import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.labelText,
      this.obscureText = false,
      this.suffixIcon,
      this.onChanged,
      this.onTap,
      this.validator,
      this.keyboardType,
      this.focusNode});
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final void Function(String)? onChanged;
  final void Function()? onTap; 
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  @override
  State<InputTextField> createState() => _InputTextFieldState();
}


class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: false,
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        filled: false,
        label: widget.labelText != null
            ? Text(
                widget.labelText!,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 64, 71, 21),
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            fontSize: 13,
            color: Color.fromRGBO(190, 190, 190, 1),
            fontWeight: FontWeight.normal),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0.5,
            color: Color.fromRGBO(131, 140, 72, 1),
          ),
        ),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}