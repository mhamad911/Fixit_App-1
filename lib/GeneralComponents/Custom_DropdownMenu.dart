
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> list = <String>['Contractor','HomeOwner'];

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({
    super.key,
  });

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();

}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {


String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Material(

      //elevation will add drop shadow
      elevation: 8,
      //This is the shadow color
      shadowColor: Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(11)),

      child:     ButtonTheme(
        alignedDropdown: true,
        child:  DropdownMenu<String>(

          textStyle: GoogleFonts.libreCaslonText( textStyle: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w500,
          ),
          ),

          width: 125,
          hintText: 'User Type',
          initialSelection: list.first,


          onSelected: (String? value) {

            // This is called when the user selects an item.
            setState(() {

              dropdownValue = value!;
            });

          },

          inputDecorationTheme: InputDecorationTheme(

            border: MaterialStateOutlineInputBorder.resolveWith(

                  (states) => states.contains(WidgetState.focused)
                  ? const OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                  : const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
          dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>

              (

                value: value, label: value);

          }).toList(),

        ),
      ),
    );
  }
}