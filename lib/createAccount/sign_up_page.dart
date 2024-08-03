import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Model/user.dart';
import '../Provider/auth_provider.dart';
import '../Veiw/sign_in_page.dart';
import '/GeneralComponents/Custom_DropdownMenu.dart';
import '/GeneralComponents/Custom_Button.dart';
import '/GeneralComponents/custom_textfield.dart';
import 'Register_Contractor.dart'; // استيراد صفحة Register_Contractor

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final streetController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String selectedUserType = '';
  String selectedCountry = '';
  String selectedCity = '';
  String selectedService_type='';
  void _submit() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        userName: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        number: phoneController.text,
        country: selectedCountry,
        city: selectedCity,
        address: streetController.text,
        type: selectedUserType,
        service_type: ''
      );

      print('User data: ${user.toJson()}'); // التأكد من أن البيانات صحيحة قبل إرسالها

      Provider.of<AuthProvider>(context, listen: false).signUp(user).then((_) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        if (authProvider.isAuthenticated) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(37.2),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Create",
                              style: GoogleFonts.getFont(
                                'Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: const Color(0xff6A3BA8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "account",
                              style: GoogleFonts.getFont(
                                'Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Please Fill your information below ",
                          style: GoogleFonts.getFont(
                            'Libre Caslon Text',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter user name';
                        }
                        return null;
                      },
                      maxLength: 100,
                      controller: userNameController,
                      name: "username...",
                      prefixIcon: Icons.person_rounded,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: null,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
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
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your phone number';
                        }
                        return null;
                      },
                      maxLength: 100,
                      controller: phoneController,
                      name: "phone...",
                      prefixIcon: Icons.phone_android_rounded,
                      inputType: TextInputType.phone,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: null,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: DropdownMenuExample(
                      items: ['Home Owner', 'Contractor'],
                      onSelected: (String value) {
                        setState(() {
                          selectedUserType = value;
                          if (value == 'Contractor') {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterContractor()));
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        DropdownMenuExample(
                          items: ['Syria', 'Jordan', 'Qatar'],
                          onSelected: (String value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          },
                        ),
                        const SizedBox(width: 22),
                        DropdownMenuExample(
                          items: ['Damascus', 'Aleppo', 'Homs', 'Amman', 'Doha'],
                          onSelected: (String value) {
                            setState(() {
                              selectedCity = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' please enter street';
                        }
                        return null;
                      },
                      maxLength: 100,
                      controller: streetController,
                      name: "type your street address...",
                      prefixIcon: Icons.streetview_rounded,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: null,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.length < 8) {
                          return 'Must be more than 8 characters';
                        }
                        return null;
                      },
                      maxLength: 100,
                      obscureText: true,
                      controller: passwordController,
                      name: "password...",
                      prefixIcon: Icons.lock,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password again';
                        }
                        if (value.length < 8) {
                          return 'Must be more than 8 characters';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      maxLength: 100,
                      obscureText: true,
                      controller: confirmPasswordController,
                      name: "confirm password...",
                      prefixIcon: Icons.lock,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          fontSize: 12,
                          height: 50,
                          textcolor: 0xffFFFFFF,
                          text: 'Register',
                          backgroundColor: const Color(0xff6A3BA8),
                          width: 120,
                          onPressed: () {
                            _submit();
                          }
                        ),
                        const SizedBox(width: 22),
                        CustomButton(
                          fontSize: 12,
                          height: 50,
                          textcolor: 0xff6A3BA8,
                          width: 120,
                          text: 'Cancel',
                          backgroundColor: const Color(0xffFFFFFF),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
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
      ),
    );
  }
}
