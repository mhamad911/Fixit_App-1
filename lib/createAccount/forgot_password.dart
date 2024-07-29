import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '/GeneralComponents/Custom_Button.dart';
import '/GeneralComponents/custom_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child:SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,

          ),
          child:   Padding(
            padding: const EdgeInsets.all(37.2),
            child: Form(
              key: _formKey,

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

                                text:  "Password",
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

                          text:  "use your registered email ",
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 5) {
                          return 'Must be more than 5 charater';
                        }
                      },
                      maxLength: 100,
                      controller: nameController,
                      name: "new password...",
                      prefixIcon: Icons.lock,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words, suffixIcon: Icons.remove_red_eye,
                    ),

                  ),
                  const SizedBox(height: 24),
                  Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                  ),
                    child: CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value != passController.text) {
                            return 'Must be same password';
                          }
                        },
                      maxLength: 100,
                      controller: nameController,
                      name: "confirm password...",
                      prefixIcon: Icons.lock,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                        suffixIcon: Icons.remove_red_eye
                    ),

                  ),
                  const SizedBox(height: 44),
                  Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                  ),
                    child:   CustomButton(
                      fontSize: 12,
                      height: 50,
                      width: 250,
                      textcolor: 0xffffffff,
                      text: 'Send Code',
                      backgroundColor: const Color(0xff6A3BA8),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                    ),
                  ),

                ],

              ),
            ),
          ),

        ),
      ),
    );


  }

}
