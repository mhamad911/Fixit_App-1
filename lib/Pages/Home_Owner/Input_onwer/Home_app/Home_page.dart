
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
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ImageTextButton(
                          onPressed: () {},
                          image: AssetImage('images/1.png'),
                          text:'Cleaning'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImageTextButton(
                          onPressed: () {},
                          image: AssetImage('images/2.png'),
                          text:'Cleaning'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,),
                      child: ImageTextButton(
                          onPressed: () {},
                          image: AssetImage('images/3.jpg'),
                          text:'Cleaning'
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 33,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ImageTextButton(
                          onPressed: () {},
                          image: AssetImage('images/4.jpg'),
                          text:'Cleaning'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImageTextButton(
                          onPressed: () {},
                          image: AssetImage('images/5.jpg'),
                          text:'Cleaning'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,),
                      child: ImageTextButton(
                          onPressed: () {},
                          image: AssetImage('images/6.jpg'),
                          text:'Cleaning'
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 33, bottom: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ImageTextButton(
                        onPressed: () {},
                        image: AssetImage('images/7.jpg'),
                        text:'Cleaning',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImageTextButton(
                        onPressed: () {},
                        image: AssetImage('images/8.jpg'),
                        text:'Cleaning',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ImageTextButton(
                        onPressed: () {},
                        image: AssetImage('images/9.jpg'),
                        text:'Cleaning',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ImageTextButton(
                          onPressed: () {},
                          image: AssetImage('images/10.jpg'),
                          text:'Cleaning'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImageTextButton(
                        onPressed: () {},
                        image: AssetImage('images/11.jpg'),
                        text:'Cleaning',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,),
                      child: ImageTextButton(
                        onPressed: () {},
                        image: AssetImage('images/12.jpg'),
                        text:'Cleaning',
                      ),
                    ),
                  ],
                ),
              )
            ],

          ),
        ),

      ),
    );


  }

}


