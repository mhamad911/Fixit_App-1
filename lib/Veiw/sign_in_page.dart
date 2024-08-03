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

   SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      Provider.of<AuthProvider>(context, listen: false).signIn(email, password).then((_) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);

        // التحقق من حالة التوثيق وطباعة القيم للعثور على المشاكل
        debugPrint('Authenticated: ${authProvider.isAuthenticated}');
        debugPrint('User Type: ${authProvider.userType}');
        debugPrint('Token: ${authProvider.token}');

        if (authProvider.isAuthenticated) {
          // تأكد من نوع المستخدم ثم انتقل إلى الصفحة المناسبة
          if (authProvider.userType == 'Home Owner') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
          } else if (authProvider.userType == 'Contractor') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ContractorHomePage()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Unknown user type')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(authProvider.errorMessage)),
          );
        }
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred. Please try again.')),
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
                        if (value == null || value.isEmpty) {
                          return 'please enter your email';
                        }
                        return null;
                      },
                      maxLength: 100,
                      controller: emailController,
                      name: "Email...",
                      prefixIcon: Icons.email_rounded,
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: null,
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
                      controller: passwordController,
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
                    height: 50, fontSize: 12,
                      width: 250,
                      textcolor: 0xffffffff,
                      text: 'Sign in',
                      backgroundColor: const Color(0xff6A3BA8),
                      onPressed:() {
                      submit();
                      }
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
