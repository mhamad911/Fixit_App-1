import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Container(decoration:BoxDecoration(borderRadius:BorderRadius.circular(55),
          color:Colors.black87,
        ),
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 140, top: 140),
          // padding: EdgeInsets.only(left: 10, top: 10),
          height: 120,
          width: 120,
          child:Text('FIXIT',style:TextStyle(color:Colors.white,fontSize:25),),
        ),
    );
  }
}
