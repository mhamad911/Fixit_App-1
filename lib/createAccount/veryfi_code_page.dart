import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../GeneralComponents/custom_textfield_verify.dart';
import '/GeneralComponents/Custom_Button.dart';

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  set _text(String _text) {}
  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      Uri _url = Uri.parse('https://www.educative.io');
      if (await launchUrl(_url)) {
        await launchUrl(_url);
      } else {
        throw 'Could not launch $_url';
      }
    }
    return Scaffold(

      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black54, // Customizing the color of the back button
          onPressed: () {
            Navigator.pop(context);
          },
          // You can also customize the icon by providing a different icon widget
          // icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child:SingleChildScrollView(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(

                              text:  "Verify",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
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

                              text:  "Code",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color(0xff000000),
                              ),
                            ),
                          ]

                      ),

                    ),
                  ],
                ),
                SizedBox(height: 26),
                RichText(

                  text: TextSpan(
                    children: [
                      TextSpan(

                        text:  "Please enter the code we just send to the  ",
                        style: GoogleFonts.getFont('Libre Caslon Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff000000),
                        ),
                      ),

                    ],
                  ),
                ),
                RichText(

                  text: TextSpan(
                    children: [
                      TextSpan(

                        text:  "example@gmail.com ",
                        style: GoogleFonts.getFont('Libre Caslon Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff000000),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 34),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      CustomTextFieldVerify(
                        width: 55,
                        maxLength: 1,
                        controller: nameController,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, prefixIcon: Icons.numbers_rounded, align: TextAlign.left, height: 50, maxLine: 1, HintText: '',
                      ),
                      SizedBox(width: 20),

                      CustomTextFieldVerify(
                        align: TextAlign.center, height: 50, maxLine: 1, HintText: '-',
                        width: 55,
                        maxLength: 1,
                        controller: nameController,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, prefixIcon: Icons.numbers_rounded,
                      ),
                      SizedBox(width: 20),

                      CustomTextFieldVerify(
                        align: TextAlign.center, height: 50, maxLine: 1, HintText: '-',
                        width: 55,
                        maxLength: 1,
                        controller: nameController,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, prefixIcon: Icons.numbers_rounded,
                      ),
                      SizedBox(width: 20),

                      CustomTextFieldVerify(
                        width: 55,
                        align: TextAlign.center, height: 50, maxLine: 1, HintText: '-',
                        maxLength: 1,
                        controller: nameController,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, prefixIcon: null,
                      ),

                    ],
                  ),

                ),
                SizedBox(height: 44),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Didn’t receive code ?",
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff7F7F7F),
                                ),
                              ),
                            ]

                        ),

                      ),
                      SizedBox(width: 5),
                      Container(

                        padding: EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide (
                                color: Color(0xff6A3BA8),
                                width: 1.5,
                              )
                          ),
                        ),

                        child:  InkWell(
                          onTap: _launchURL,
                          child:  RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:  "Resend",
                                  style: GoogleFonts.getFont('Libre Caslon Text',

                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff6A3BA8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 44),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: 'Verify',
                    backgroundColor: Color(0xff6A3BA8),
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Sign in')));
                    }, height: 50, fontSize: 12,
                  ),
                ),

              ],

            ),
          ),

        ),
      ),
    );


  }

}