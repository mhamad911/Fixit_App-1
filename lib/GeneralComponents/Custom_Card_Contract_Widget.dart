import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Custom_Button.dart';

class CustomCardCONC extends StatelessWidget {
  final Image image;
  final String name;
  final String email;
  final String desc;
  final String number;
  final String date;
final Function() ontapCon;
  const CustomCardCONC({
    Key? key,
    required this.image,
    required this.email,
    required this.desc,
    required this.number,
    required this.name,
    required this.date,
required this.ontapCon,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

           Padding(
             padding: const EdgeInsets.only(right: 12,top: 16),
             child: RichText(
               text: TextSpan(
                   children: [
                     TextSpan(
                       text:  date,
                       style: GoogleFonts.getFont('Libre Caslon Text',
                         fontWeight: FontWeight.w500,
                         fontSize: 10,
                         color: Colors.grey,
                       ),
                     ),

                   ]
               ),
             ),
           ),
              Row(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,bottom: 10 ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                    offset: Offset.fromDirection(90))
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              'images/image2.png',
                              fit: BoxFit.cover,
                              width: 45,
                              height: 45,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 12),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(

                                      text:  name,
                                      style: GoogleFonts.getFont('Libre Caslon Text',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Color(0xff000000),
                                      ),
                                    ),

                                  ]
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 7),

                        Row(
                          children: [
                            Container(

                              width: 200,
                              child: InkWell(
                                onTap: ontapCon,
                                child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                
                                          text:  desc
                                              ,
                                          style: GoogleFonts.getFont('Libre Caslon Text',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        TextSpan(

                                          text:  "View Contract"
                                          ,
                                          style: GoogleFonts.getFont('Libre Caslon Text',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 9),
                        Row(
                          children: [

                            SizedBox(width: 5),

                            Row(
                              children: [
                                CustomButton(
                                  fontSize:12.5,
                                  width: 90,
                                  height: 50,
                                  textcolor: 0xffffffff,
                                  text: 'Accept',
                                  backgroundColor: Color(0xff6A3BA8),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text('Sign in')));
                                  },

                                ),
                                SizedBox(width: 22),

                                CustomButton(
                                  fontSize:12.5,
                                  width: 90,
                                  height: 50,
                                  textcolor: 0xffffffff,
                                  text: 'Cancel',
                                  backgroundColor: Color(0xff6A3BA8),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text('Sign in')));
                                  },

                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}