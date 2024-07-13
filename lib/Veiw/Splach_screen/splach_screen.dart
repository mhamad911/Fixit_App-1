import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled14/Veiw/Splach_screen/component_splach.dart';

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
      body:Column(
        children: [
          Component(child:Text(''),)
        ],
      )
    );
  }
}
