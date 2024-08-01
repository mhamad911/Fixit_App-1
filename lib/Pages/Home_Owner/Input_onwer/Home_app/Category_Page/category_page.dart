


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../GeneralComponents/Custom_App_bar.dart';
import '../../../../../GeneralComponents/Custom_Card_Widget.dart';

class CategoryPage extends StatefulWidget {
  final String email;
  final String number;
  final String name;
  final String category;
  final String local;
  CategoryPage({
    required this.email,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
  });

  @override
  _CategoryPageState createState() => _CategoryPageState();
}
class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: SingleChildScrollView(
            child: Column  (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCard(image: Image.asset(
                    'assets/2.png'), email: widget.email, desc: 'this is an example of describtion of a person working for 20 years', number:widget.number, name: widget.name, category: widget.category, local: widget.local),

              ],

            ),
          ),
        ),
      ),
    );


  }

}
