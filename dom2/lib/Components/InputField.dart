// import 'dart:ffi';

import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key,
      required this.errorMessage,
      required this.isSecure,
      required this.placeholder,
      this.pt = 0.0,
      this.pb = 0.0,
      this.pr = 0.0,
      this.pl = 0.0,
      required this.controller});
  final String errorMessage;
  final bool isSecure;
  final String placeholder;
  final double pt;
  final double pb;
  final double pr;
  final double pl;
  final TextEditingController controller;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: widget.pb,
            top: widget.pt,
            left: widget.pl,
            right: widget.pr),
        child: TextFormField(
          obscureText: widget.isSecure,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.placeholder,
            hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 20),
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 21),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return widget.errorMessage;
            }
            return null;
          },
          controller: widget.controller,
        ));
  }
}
