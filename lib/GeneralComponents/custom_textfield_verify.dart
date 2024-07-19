import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldVerify extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final int maxLength;
  final double width;

  const CustomTextFieldVerify({
    super.key,
    required this.controller,
    required this.name,
     required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.maxLength,
    required this.width,

  });

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation will add drop shadow
      elevation: 8,
      //This is the shadow color
      shadowColor: Colors.black,
       borderRadius: const BorderRadius.all(Radius.circular(11)),

      child: SizedBox(
        height: 50,
        width: width,
        child: TextField(

          enabled: true,
          controller: controller,
          textCapitalization: textCapitalization,
          maxLength: maxLength,
          maxLines: 1,
          obscureText: obscureText,
          keyboardType: inputType,
          textAlign: TextAlign.center,

          style: const TextStyle(

            color: Colors.black,
            fontSize: 12,
          ),

          decoration: InputDecoration(
            alignLabelWithHint: true,

            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            isDense: true,
            label: const Center(
              child: Text("-"),
            ),
            counterText: "",
            labelStyle: const TextStyle(
                fontSize: 10,
                color: Colors.black),
            suffixStyle: GoogleFonts.getFont('Libre Caslon Text', fontWeight: FontWeight.w400,
            ),

          ),
        ),
      ),
    );
  }
}