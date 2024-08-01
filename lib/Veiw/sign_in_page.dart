import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled14/Pages/Home_Owner/Input_onwer/Home_app/Home_page.dart';
import 'package:untitled14/createAccount/sign_up_page.dart';
import '../Pages/Contractor/Input_contractor/Home_page/Contractor_Home_Page_Main.dart';
import '../Provider/auth_provider.dart';
import '../createAccount/change_password_c_email_page.dart';
import '/GeneralComponents/Custom_Button.dart';
import '/GeneralComponents/custom_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final nameController = TextEditingController();
  final passController = TextEditingController();
  final _formKey =GlobalKey<FormState>();
  void _submit() {
    if (_formKey.currentState!.validate()) {
      final username = nameController.text;
      final password = passController.text;

      Provider.of<AuthProvider>(context, listen: false).signIn(
          username, password).then((_) {
        final userType = Provider
            .of<AuthProvider>(context, listen: false)
            .userType;
        if (Provider
            .of<AuthProvider>(context, listen: false)
            .isAuthenticated) {
          if (userType == 'Contractor') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ContractorHomePage()));
          } else if (userType == 'HomeOwner') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          }
        }
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(Provider
              .of<AuthProvider>(context, listen: false)
              .errorMessage)),
        );
      });
    }
  }

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
          child:   Container(
            width:  double.maxFinite,
            padding: const EdgeInsets.all(37.2),
            child: Form(
              key:_formKey,
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
                      validator: (value) {
                        // add your custom validation here.
                        if (value!.isEmpty) {
                          return 'Please enter user name';
                        }

                      },
                      maxLength: 100,
                      controller: nameController,
                      name: "username...",
                      prefixIcon: Icons.person_rounded,
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.words, suffixIcon: null,
                    ),

                  ),
                  const SizedBox(height: 24),
                  Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                  ),
                    child: CustomTextField(
                      validator: (value){ if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 8) {
                        return 'Must be more than 8 charater';
                      }
                      },
                      maxLength: 100,

                      obscureText: true,
                      controller: passController,
                      name: "password...",
                      prefixIcon: Icons.lock,
                      inputType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: Icons.remove_red_eye,
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
                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangePasswordPage())),
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
                      // onPressed:_submit, دالة تسجيل الدخول
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ContractorHomePage()));
                      },
                      height: 50, fontSize: 12,
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
                            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp())),
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
      ),
    );


  }

}
