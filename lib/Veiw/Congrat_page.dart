

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CongratPage extends StatefulWidget {

  @override
  _CongratPageState createState() => _CongratPageState();
}


class _CongratPageState extends State<CongratPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: BackButton(
          color: Colors.black, // Customizing the color of the back button
          onPressed: () {
            Navigator.pop(context);
          },
          // You can also customize the icon by providing a different icon widget
          // icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,

      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image:AssetImage('assets/Congrat.png')),

            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(

                        text:  "Congratulation!",
                        style: GoogleFonts.getFont('Libre Caslon Text',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Color(0xff000000),
                        ),
                      ),

                    ]

                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(

                        text:  "process is done successfully",
                        style: GoogleFonts.getFont('Libre Caslon Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff6E6E6E),
                        ),
                      ),

                    ]

                ),

              ),
            ),
          ],
        ),
      ),
    );


  }

}