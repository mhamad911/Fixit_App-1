import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../GeneralComponents/Custom_Button.dart';
import '../GeneralComponents/Custom_DropdownMenu.dart';
import '../GeneralComponents/custom_textfield.dart';
import '../Provider/auth_provider.dart';
import '../Veiw/sign_in_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffFFFFFF)),
      debugShowCheckedModeBanner: false,
      home: RegisterContractor(),
    );
  }
}

class RegisterContractor extends StatefulWidget {
  const RegisterContractor({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<RegisterContractor> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final userTypeController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final serviceType =TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String selectedUserType = '';
  String selectedCountry = '';
  String selectedCity = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final registrationData = {
        'username': usernameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'userType': selectedUserType,
        'country': selectedCountry,
        'city': selectedCity,
        'street': streetController.text,
        'password': passwordController.text,
        'serviceType':serviceType.text
      };

      Provider.of<AuthProvider>(context, listen: false).signUp(registrationData).then((_) {
        if (Provider.of<AuthProvider>(context, listen: false).isAuthenticated) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
        }
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(Provider.of<AuthProvider>(context, listen: false).errorMessage)),
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
                      },
                      maxLength: 100,
                      controller: usernameController,
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
                      items: ['Cleaning', 'Handyman','Movers','Landscaping','HVAC','Plumbing','Snow Removal','Eletrician','Roof Repair','Carpet Cleaning','Flooring','Carpenter',],
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
                      },
                      maxLength: 100,
                      obscureText: true,
                      controller: passwordController,
                      name: "password...",
                      prefixIcon: Icons.phone_android_rounded,
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
                      },
                      maxLength: 100,
                      obscureText: true,
                      controller: confirmPasswordController,
                      name: "confirm password...",
                      prefixIcon: Icons.phone_android_rounded,
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
                            if (_formKey.currentState!.validate()) {
                              _submit();
                            }
                          },
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
