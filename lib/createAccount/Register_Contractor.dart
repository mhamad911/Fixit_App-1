import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled14/Model/user.dart'; // تأكد من أن هذا المسار صحيح

import '../GeneralComponents/Custom_Button.dart';
import '../GeneralComponents/Custom_DropdownMenu.dart';
import '../GeneralComponents/custom_textfield.dart';
import '../Provider/auth_provider.dart';
import '../Veiw/sign_in_page.dart';

class RegisterContractor extends StatefulWidget {
  const RegisterContractor({Key? key}) : super(key: key);

  @override
  _RegisterContractorState createState() => _RegisterContractorState();
}

class _RegisterContractorState extends State<RegisterContractor> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String selectedUserType = '';
  String selectedCountry = '';
  String selectedCity = '';
  String selectedservice_type = '';
  String? UserType;
  void Register(){
    if (_formKey.currentState!.validate()) {
      final newUser = User(
        userName: userNameController.text,
        email: emailController.text,
        number: phoneController.text,
        type: selectedUserType,
        country: selectedCountry,
        city: selectedCity,
        address: streetController.text,
        password: passwordController.text,
        service_type:selectedservice_type,
      );
      context.read<AuthProvider>().signUp(newUser).then((_) {
        if (context.read<AuthProvider>().isAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.read<AuthProvider>().errorMessage)),
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
            width: double.infinity,
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
                          return 'Please enter user name';
                        }
                        final usernameRegex=RegExp((r"^[a-zA-Z]+$"));
                        if(!usernameRegex.hasMatch(value)){
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                      maxLength: 100,
                      controller: userNameController,
                      name: "Username...",
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
                          return 'Please enter your email';
                        }
                        final emailRegex=RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
                        if(!emailRegex.hasMatch(value)){
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      maxLength: 100,
                      controller: emailController,
                      name: "Email...",
                      prefixIcon: Icons.email_rounded,
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
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
                        final phoneRegex=RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                        if(!phoneRegex.hasMatch(value)){
                          return 'Please enter valid mobile number';
                        }
                        return null;
                      },
                      maxLength: 100,
                      controller: phoneController,
                      name: "Phone...",
                      prefixIcon: Icons.phone_android_rounded,
                      inputType: TextInputType.phone,
                      textCapitalization: TextCapitalization.none,
                      suffixIcon: null,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: DropdownMenuExample(
                      items: ['Contractor', 'Home Owner'],
                      onSelected: (String value) {
                        setState(() {
                          selectedUserType = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: DropdownMenuExample(
                      items: ['Cleaning', 'Handyman', 'Movers', 'Landscaping', 'HVAC', 'Plumbing', 'Snow Removal', 'Electrician', 'Roof Repair', 'Carpet Cleaning', 'Flooring', 'Carpenter'],
                      onSelected: (String value) {
                        setState(() {
                          selectedservice_type = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownMenuExample(
                            items: ['Syria', 'Jordan', 'Qatar'],
                            onSelected: (String value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 22),
                        Expanded(
                          child: DropdownMenuExample(
                            items: ['Damascus', 'Aleppo', 'Homs', 'Amman', 'Doha'],
                            onSelected: (String value) {
                              setState(() {
                                selectedCity = value;
                              });
                            },
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
                          return 'Please enter street';
                        }
                        return null;
                      },
                      maxLength: 100,
                      controller: streetController,
                      name: "Street address...",
                      prefixIcon: Icons.streetview_rounded,
                      inputType: TextInputType.streetAddress,
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
                        } final passwordRegex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if(!passwordRegex.hasMatch(value)){
                          return 'Password must contain at least one letter and one number';
                        }
                        return null;
                      },
                      maxLength: 100,
                      obscureText: true,
                      controller: passwordController,
                      name: "Password...",
                      prefixIcon: Icons.lock_rounded,
                      inputType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      maxLength: 100,
                      obscureText: true,
                      controller: confirmPasswordController,
                      name: "Confirm Password...",
                      prefixIcon: Icons.lock_rounded,
                      inputType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
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
                            Register();
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
