import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled14/Pages/Home_Owner/Input_onwer/Home_app/Category_Page/category_page.dart';
import '../../../../GeneralComponents/Custom_App_bar.dart';
import '../../../../GeneralComponents/Custom_Bottom_naf_Bar.dart';
import '../../../../GeneralComponents/Custome_image_Button.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final String email = 'example@gmail.com';
  final String number = '0933445522';
  final String name = 'mhamad alshame';
  final String category = 'electrication';
  final String local = 'oliver333/builder44';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnackBarBody(
      ),
      appBar: CustomAppBar(title: '',
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child:   Container(
          width:  double.maxFinite,
          padding: EdgeInsets.all(37.2),
          child: Column  (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text:  "Pick a",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ]
                      ),
                    ),
                    SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text:  "Service",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff6A3BA8),
                              ),
                            ),
                          ]
                      ),
                    ),
                    SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text:  "that you need!",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ImageTextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));
                          },
                          image: AssetImage('assets/1.png'),
                          text:'Carpenter'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImageTextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));
                          },
                          image: AssetImage('assets/2.png'),
                          text:'Movers'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,),
                      child: ImageTextButton(
                          onPressed: () {                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));
                          },
                          image: AssetImage('assets/13.jpg'),
                          text:'Air Conditioning'
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 33,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ImageTextButton(
                          onPressed: () {                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));
                          },
                          image: AssetImage('assets/14.png'),
                          text:'Plumbing'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImageTextButton(
                          onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));
                          },
                          image: AssetImage('assets/5.jpg'),
                          text:'HVAC'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,),
                      child: ImageTextButton(
                          onPressed: () {      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));
                          },
                          image: AssetImage('assets/6.jpg'),
                          text:'Landscaping'
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 33, bottom: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ImageTextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));

                        },
                        image: AssetImage('assets/7.jpg'),
                        text:'Cleaning',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImageTextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));

                        },
                        image: AssetImage('assets/8.jpg'),
                        text:'Snow Removal',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ImageTextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));

                        },
                        image: AssetImage('assets/9.jpg'),
                        text:'Electrician',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ImageTextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));

                          },
                          image: AssetImage('assets/10.jpg'),
                          text:'Cleaning'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImageTextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));
                        },
                        image: AssetImage('assets/11.jpg'),
                        text:'Handyman',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,),
                      child: ImageTextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPage(category:category,email: email,local:local,name:name,number:number,)));

                        },
                        image: AssetImage('assets/12.jpg'),
                        text:'Flooring',
                      ),
                    ),
                  ],
                ),
              )
            ],

          ),
        ),

      ),
    );
  }
}


