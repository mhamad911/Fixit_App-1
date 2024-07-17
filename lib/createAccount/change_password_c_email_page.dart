import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '/GeneralComponents/Custom_Button.dart';
import '/GeneralComponents/custom_textfield.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

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

                              text:  "Change",
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

                              text:  "Password",
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

                        text:  "use your registered email ",
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
                  child: CustomTextField(
                    maxLength: 100,
                    controller: nameController,
                    name: "Email...",
                    prefixIcon: Icons.email_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                  ),

                ),
                SizedBox(height: 44),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: 'Send Code',
                    backgroundColor: Color(0xff6A3BA8),
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Sign in')));
                    },
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
