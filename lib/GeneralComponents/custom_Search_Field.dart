import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchfield extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final int maxLength;

  const CustomSearchfield({
    Key? key,
    required this.controller,
    required this.name,
     required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.maxLength,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation will add drop shadow
      elevation: 8,
      //This is the shadow color
      shadowColor: Colors.black,
       borderRadius: BorderRadius.all(Radius.circular(8)),

      child: Center(
        child: SizedBox(
          height: 40,
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
              contentPadding: EdgeInsets.all(17.0),
              alignLabelWithHint: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Material
                  (
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),topLeft: Radius.circular(8),),
                   color: Color(0xff9B6CD7),
                    child: Icon(Icons.search,
                      color: Colors.white,
                      size: 21,)),
              ),
              isDense: true,
              labelText: name,
              counterText: "",
              labelStyle: const TextStyle(

                  fontSize: 10,
                  color: Colors.grey),
              suffixStyle: GoogleFonts.getFont('Libre Caslon Text', fontWeight: FontWeight.w400,
              ),

            ),

          ),
        ),
      ),
    );
  }
}