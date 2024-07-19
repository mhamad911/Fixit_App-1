import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/GeneralComponents/Custom_DropdownMenu.dart';
import 'package:url_launcher/url_launcher.dart';
import '/GeneralComponents/Custom_Button.dart';
import '/GeneralComponents/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String _selected;
  final List<Map> _myJson = [
    {},
    {},
    {},
    {},


  ];
  String? selectedValue;
  late OverlayPortalController controller1;
  late OverlayPortalController controller2;
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

                              text:  "Create",
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

                              text:  "account",
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
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(

                        text:  "Please Fill your information below ",
                        style: GoogleFonts.getFont('Libre Caslon Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
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
                const SizedBox(height: 22),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child: CustomTextField(
                    maxLength: 100,
                    controller: nameController,
                    name: "Email...",
                    prefixIcon: Icons.email_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words, suffixIcon: null,
                  ),

                ),
                const SizedBox(height: 22),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child: CustomTextField(
                    maxLength: 100,
                    obscureText: true,
                    controller: passController,
                    name: "phone...",
                    prefixIcon: Icons.phone_android_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words, suffixIcon: null,
                  ),

                ),
                const SizedBox(height: 22),


                const Align(
                  alignment: Alignment.bottomLeft, child:
                Column(
                  children: [
                    DropdownMenuExample(
                    ),

                  ],
                ),
                ),
                const SizedBox(height: 22),


                const Align(
                  alignment: Alignment.bottomLeft, child:
                Row(
                  children: [

                    DropdownMenuExample(

                    ),
                    SizedBox(width: 22),

                    DropdownMenuExample(

                    ),

                  ],
                ),
                ),
                const SizedBox(height: 22),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child: CustomTextField(
                    maxLength: 100,
                    obscureText: true,
                    controller: passController,
                    name: "type your street address...",
                    prefixIcon: Icons.streetview_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words, suffixIcon: null,
                  ),

                ),
                const SizedBox(height: 22),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child: CustomTextField(
                    maxLength: 100,
                    obscureText: true,
                    controller: passController,
                    name: "password...",
                    prefixIcon: Icons.phone_android_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words, suffixIcon: Icons.remove_red_eye,
                  ),

                ),
                const SizedBox(height: 22),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child: CustomTextField(
                    maxLength: 100,
                    obscureText: true,
                    controller: passController,
                    name: "confirm password...",
                    prefixIcon: Icons.phone_android_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words, suffixIcon: Icons.remove_red_eye,
                  ),

                ),
                const SizedBox(height: 24),
                Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      CustomButton(
                        textcolor: 0xffFFFFFF,
                        text: 'Register',
                        backgroundColor: const Color(0xff6A3BA8),
                        width: 120,
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Sign in')));
                        },
                      ),
                      const SizedBox(width: 22  ),
                      CustomButton(
                        textcolor: 0xff6A3BA8,
                        width: 120,
                        text: 'Cancel',
                        backgroundColor: const Color(0xffFFFFFF),
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Sign in')));
                        },
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