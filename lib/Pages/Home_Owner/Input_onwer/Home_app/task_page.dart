

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../GeneralComponents/Custom_Button.dart';
import '../../../../GeneralComponents/Custom_DropdownMenu.dart';
import '../../../../GeneralComponents/Custome_image_Button_H.dart';
import '../../../../GeneralComponents/custom_textfield.dart';
import '../../../../GeneralComponents/custom_textfield_verify.dart';


class Taskpage extends StatefulWidget {

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  late String _selected;
  List<Map> _myJson = [
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

      appBar: AppBar(
        title:  Padding(
          padding: const EdgeInsets.only(left: 60),
          child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(

                    text:  "Task Creation",
                    style: GoogleFonts.getFont('Libre Caslon Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ]
            ),
          ),
        ),
        leading: BackButton(
          color: Colors.black, // Customizing the color of the back button
          onPressed: () {
            Navigator.pop(context);
          },
          // You can also customize the icon by providing a different icon widget
          // icon: Icon(Icons.arrow_back),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child:SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,

          ),
          child:   Container(
            width:  double.maxFinite,
            padding: EdgeInsets.all(32.2),
            child: Column  (
              children: [
                SizedBox(height: 12),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "Task Title:",
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ]

                        ),

                      ),
                      SizedBox(width: 12),

                      CustomTextFieldVerify(
                        maxLine: 1,
                        HintText: 'mhamad',
                        maxLength: 100,
                        controller: nameController,
                        prefixIcon: null,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, width: 220, align: TextAlign.left, height: 50,
                      ),
                    ],
                  ),

                ),

                SizedBox(height: 33),

                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(

                                  text:  "Task Description : ",
                                  style: GoogleFonts.getFont('Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ]

                          ),

                        ),
                      ),
                      SizedBox(height: 12),

                      CustomTextFieldVerify(
                        maxLine: 20,
                        HintText: 'mhamad',
                        maxLength: 400,
                        controller: nameController,
                        prefixIcon: null,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words, width: 300, align: TextAlign.left, height: 200,

                      ),
                    ],
                  ),

                ),

                SizedBox(height: 33),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:12),
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(

                                  text:  "Task Location : ",
                                  style: GoogleFonts.getFont('Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ]

                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        DropdownMenuExample(

                        ),
                        SizedBox(width: 22),

                        DropdownMenuExample(

                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 33),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child: CustomTextField(
                    maxLength: 100,
                    obscureText: false,
                    controller: nameController,
                    name: "Type the Location of your task..",
                    prefixIcon: Icons.streetview_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words, suffixIcon: null,
                  ),

                ),
                SizedBox(height: 33),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left:12),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(

                              text:  "Task Picture: ",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ]

                      ),

                    ),
                  ),
                ),
                SizedBox(height: 12),

                SingleChildScrollView (
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [

                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('build/images/Union.png'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('images/download.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('images/download.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('images/download.jpg'), text: '',),
                        SizedBox(width: 12),

                        ImageTextButtonH(onPressed: () {  },  image: const AssetImage('images/download.jpg'), text: '',),
                        SizedBox(width: 12),


                      ],
                    ),
                  ),
                ),

                SizedBox(height: 50),
                Padding(padding: EdgeInsets.symmetric(horizontal:  1
                ),
                  child:   CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: 'Send Task',
                    backgroundColor: Color(0xff6A3BA8),
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Task Send')));
                    }, height: 50, fontSize: 12,
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

