import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '/GeneralComponents/Custom_Button.dart';
import '/GeneralComponents/custom_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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

                              text:  "Sign",
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

                              text:  "in",
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

                        text:  "Enter your credential to login",
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
                  child: CustomTextField(
                    maxLength: 100,
                    controller: nameController,
                    name: "username...",
                    prefixIcon: Icons.person_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words, suffixIcon: null,
                  ),

                ),
                const SizedBox(height: 24),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child: CustomTextField(
                    maxLength: 100,

                    obscureText: true,
                    controller: passController,
                    name: "password...",
                    prefixIcon: Icons.lock,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                      suffixIcon: Icons.remove_red_eye
                  ),

                ),
                const SizedBox(height: 22),

                Align(
                  alignment: Alignment.bottomRight, child:
                Column(
                  children: [
                    Container(

                      padding: const EdgeInsets.only(bottom: 5),
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
                                text:  "Forgot Password?",
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
                const SizedBox(height: 24),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: 'Sign in',
                    backgroundColor: const Color(0xff6A3BA8),
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Sign in')));
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Don't have an account ?",
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
                                  text:  "Sign up",
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
              ],

            ),
          ),

        ),
      ),
    );


  }

}
