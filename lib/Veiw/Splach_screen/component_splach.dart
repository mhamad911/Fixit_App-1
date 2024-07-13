import 'package:flutter/material.dart';
import 'package:untitled14/utils/constans.dart';

class Component extends StatelessWidget {
  final Widget child;
   Component({
     required this.child,
     });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(decoration:BoxDecoration(borderRadius:BorderRadius.circular(55),
          color:Colors.black87,
        ),
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 140, top: 140),
          // padding: EdgeInsets.only(left: 10, top: 10),
          height: 120,
          width: 120,
          child:Text('FIXIT',style:kTitleTextStyle,),),
      ],
    );
  }
}
