import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';


class OutlinedDropDownButton extends StatefulWidget {
  const OutlinedDropDownButton(
      {super.key,
      required this.value,
      required this.items,
      required this.onChanged,
      this.validator});
  final Object? value;
  final List<dynamic> items;
  final void Function(Object?)? onChanged;
  final String? Function(Object?)? validator;
  @override
  State<OutlinedDropDownButton> createState() => _OutlinedDropDownButtonState();
}

class _OutlinedDropDownButtonState extends State<OutlinedDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        value: widget.value,
        validator:widget.validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0.5)),
          focusColor: const Color.fromRGBO(131, 140, 72, 1),
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
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 1,
          isOverButton: false,
          useRootNavigator: false,
          offset: const Offset(0, -4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: widget.items.map((value) {
          return DropdownMenuItem(value: value, child: Text(utf8.decode(value.toString().codeUnits)));
        }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}