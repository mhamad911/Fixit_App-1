
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../GeneralComponents/Custom_App_bar.dart';
import '../../../../GeneralComponents/Custom_Bottom_naf_Bar.dart';
import '../../../../GeneralComponents/Custome_image_Button.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {


  set _text(String _text) {}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: SnackBarBody(

      ),
      appBar: CustomAppBar(title: '',

      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,

        ),
        child:   Container(
          width:  double.maxFinite,
          padding: EdgeInsets.all(37.2),
          child: Column  (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(

                            text:  "Pick a",
                            style: GoogleFonts.getFont('Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                        ]

                    ),

                  ),
                  SizedBox(width: 5),
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(

                            text:  "Service",
                            style: GoogleFonts.getFont('Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff6A3BA8),
                            ),
                          ),
                        ]

                    ),

                  ),
                  SizedBox(width: 5),
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(

                            text:  "that you need!",
                            style: GoogleFonts.getFont('Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                        ]

                    ),

                  ),
                ],
              ),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ImageTextButton(
                      onPressed: () {},
                      image: AssetImage('images/download.jpg'),
                      text:'Cleaning'
                  ),
                  SizedBox(width: 22),
                  ImageTextButton(
                      onPressed: () {},
                      image: AssetImage('images/download.jpg'),
                      text:'Cleaning'
                  ),
                  SizedBox(width: 22),
                  ImageTextButton(
                      onPressed: () {},
                      image: AssetImage('images/download.jpg'),
                      text:'Cleaning'
                  ),
                ],
              ),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ImageTextButton(
                      onPressed: () {},
                      image: AssetImage('images/download.jpg'),
                      text:'Cleaning'
                  ),
                  SizedBox(width: 22),
                  ImageTextButton(
                      onPressed: () {},
                      image: AssetImage('images/download.jpg'),
                      text:'Cleaning'
                  ),
                  SizedBox(width: 22),
                  ImageTextButton(
                      onPressed: () {},
                      image: AssetImage('images/download.jpg'),
                      text:'Cleaning'
                  ),
                ],
              ),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ImageTextButton(
                    onPressed: () {},
                    image: AssetImage('images/download.jpg'),
                    text:'Cleaning',
                  ),
                  SizedBox(width: 22),
                  ImageTextButton(
                    onPressed: () {},
                    image: AssetImage('images/download.jpg'),
                    text:'Cleaning',
                  ),
                  SizedBox(width: 22),
                  ImageTextButton(
                    onPressed: () {},
                    image: AssetImage('images/download.jpg'),
                    text:'Cleaning',
                  ),
                ],
              ),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ImageTextButton(
                      onPressed: () {},
                      image: AssetImage('images/download.jpg'),
                      text:'Cleaning'),
                  SizedBox(width: 22),
                  ImageTextButton(
                    onPressed: () {},
                    image: AssetImage('images/download.jpg'),
                    text:'Cleaning',
                  ),
                  SizedBox(width: 22),
                  ImageTextButton(
                    onPressed: () {},
                    image: AssetImage('images/download.jpg'),
                    text:'Cleaning',
                  ),
                ],
              )
            ],

          ),
        ),

      ),
    );


  }

}


