import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import  'package:url_launcher/url_launcher.dart';
import '../../../../GeneralComponents/Custom_App_bar.dart';
import '../../../../GeneralComponents/Custom_Bottom_CON_naf_Bar.dart';
import '../../../Home_Owner/Input_onwer/Home_app/Category_Page/Category_Page_Components/Custom_Card_Widget.dart';


class ContractorHomePage extends StatefulWidget {

  @override
  _ContractorHomePageState createState() => _ContractorHomePageState();
}

class _ContractorHomePageState extends State<ContractorHomePage> {
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
      bottomNavigationBar: SnackBarBodyCON(

      ),
      appBar: CustomAppBar(title: '',

      ),

      resizeToAvoidBottomInset: false,
      body:                /* SortingSegmentedControl()*/
      Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,

        ),
        child:   Container(
          width:  double.maxFinite,
          padding: EdgeInsets.all(25.0),
          child: Column  (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 22,left: 12,top: 12),
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
              CustomCard(),
            ],

          ),
        ),

      ),
    );


  }

}


