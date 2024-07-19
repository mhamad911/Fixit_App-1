import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../GeneralComponents/custom_textfield_verify.dart';
import '/GeneralComponents/Custom_Button.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  set _text(String text) {}
  @override
  Widget build(BuildContext context) {
    launchURL() async {
      Uri url = Uri.parse('https://www.educative.io');
      if (await launchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
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
            padding: const EdgeInsets.all(37.2),
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
                                color: const Color(0xff6A3BA8),
                              ),
                            ),
                          ]

                      ),

                    ),
                    const SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(

                              text:  "Code",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ]

                      ),

                    ),
                  ],
                ),
                const SizedBox(height: 26),
                RichText(

                  text: TextSpan(
                    children: [
                      TextSpan(

                        text:  "Please enter the code we just send to the  ",
                        style: GoogleFonts.getFont('Libre Caslon Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: const Color(0xff000000),
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
                          color: const Color(0xff000000),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 34),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      CustomTextFieldVerify(
                        width: 55,
                        maxLength: 1,
                        controller: nameController,
                        name: "-",
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, prefixIcon: Icons.numbers_rounded,
                      ),
                      const SizedBox(width: 20),

                      CustomTextFieldVerify(
                        width: 55,
                        maxLength: 1,
                        controller: nameController,
                        name: "-",
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, prefixIcon: Icons.numbers_rounded,
                      ),
                      const SizedBox(width: 20),

                      CustomTextFieldVerify(
                        width: 55,
                        maxLength: 1,
                        controller: nameController,
                        name: "-",
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, prefixIcon: Icons.numbers_rounded,
                      ),
                      const SizedBox(width: 20),

                      CustomTextFieldVerify(
                        width: 55,
                        maxLength: 1,
                        controller: nameController,
                        name: "-",
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, prefixIcon: null,
                      ),

                    ],
                  ),

                ),
                const SizedBox(height: 44),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
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
                                  color: const Color(0xff7F7F7F),
                                ),
                              ),
                            ]

                        ),

                      ),
                      const SizedBox(width: 5),
                      Container(

                        padding: const EdgeInsets.only(bottom: 2),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide (
                                color: Color(0xff6A3BA8),
                                width: 1.5,
                              )
                          ),
                        ),

                        child:  InkWell(
                          onTap: launchURL,
                          child:  RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:  "Resend",
                                  style: GoogleFonts.getFont('Libre Caslon Text',

                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: const Color(0xff6A3BA8),
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
                const SizedBox(height: 44),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: 'Verify',
                    backgroundColor: const Color(0xff6A3BA8),
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