
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../GeneralComponents/Custom_Bottom_naf_Bar.dart';
import '../../../GeneralComponents/Custom_Card_Admin_Widget.dart';
import '../../../GeneralComponents/Custom_Card_Contract_Widget.dart';
import '../../../GeneralComponents/Custom_Card_Receipt_Widget.dart';

class NotificationPage extends StatefulWidget {

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: SnackBarBody(

      ),
      appBar: AppBar(
        title:  Center(
          child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text:  "Notifications",
                    style: GoogleFonts.getFont('Libre Caslon Text',
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xff000000),
                    ),
                  ),
                ]
            ),
          ),
        ),


      ),      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,

        ),
        child:   Container(

          width:  double.maxFinite,
          padding: EdgeInsets.all(30.2),
          child: Column  (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 22,left: 6,top: 12),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(

                            text:  "Today",
                            style: GoogleFonts.getFont('Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),

                        ]
                    ),
                  ),
                ),
              ),
              CustomCardCONA(image: Image.asset(
                  'assets/U.png'),  desc: 'we review your request and the receipt seems correct ', number: '099662259', name: 'omar', date: '2/8',  ),
              CustomCardCONR(image: Image.asset(
                  'assets/U.png'),  desc: 'Mhamad alshame  Finished your tasks , and here is your receipt :  ', number: '099662259', name: 'omar',  email: '', date: '2/8', ontapeReq: () {  }, ontapRi: () {  },   ),
              CustomCardCONC(image: Image.asset(
                  'assets/U.png'),  desc: 'Mhamad alshame Send you A Contract,and here is your Contract : ', number: '099662259', name: 'omar',  email: '', date: '2/8', ontapCon: () {  },   ),
            ],
          ),
        ),

      ),
    );


  }

}