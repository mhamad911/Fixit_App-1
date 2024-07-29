


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../GeneralComponents/Custom_App_bar.dart';
import '../../../../../GeneralComponents/Custom_Card_Widget.dart';

class CategoryPage extends StatefulWidget {

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
          child: Column  (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomCard(image: Image.asset(
          'images/image2.png'), email: 'example@gmail.com', desc: 'this is an example of describtion of a person working for 20 years', number: '0933445522', name: 'mhamad alshame', category: 'electrication', local: 'oliver333/builder44',),

            ],

          ),
        ),

      ),
    );


  }

}
